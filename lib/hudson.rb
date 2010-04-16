require 'simple-rss'
require 'open-uri'

module BuildLights
  class Hudson
    def initialize(uri, parser = FeedParser)
      puts "Hudson url: #{uri}" if $verbose
      @feed = parser.parse uri
    end

    def failed_jobs
      jobs = {}

      @feed.entries.each do |entry|
        match = /(.*) #\d+ (.*)/.match(entry.title)
        raise "Invalid rss title #{entry.title}" unless match
        name = match[1]
        status = match[2]

        unless jobs[name]
          jobs[name] = status
          puts "#{name} -> #{status}" if $verbose
        end
      end

      jobs.map do |name, status|
        name if /FAIL/i.match(status)
      end.compact
    end
  end

  class FeedParser
    def self.parse(uri)
      SimpleRSS.parse(open(uri))
    end
  end
end
