require 'simple-rss'
require 'open-uri'

module BuildLights
  class Hudson
    def initialize(uri, parser = FeedParser)
      puts "Hudson url: #{uri}" if $verbose      
      @feed = parser.parse uri
    end
  
    def failed_jobs
      @feed.entries.each.map do |entry|
        match = /(.*) #\d+ (.*)/.match(entry.title)
        raise "Invalid rss title #{entry.title}" unless match
        name = match[1]
        status = match[2]
        puts "#{name} -> #{status}" if $verbose
        failed = /FAIL/i.match(status)
        name if failed
      end.compact
    end
  end
  
  class FeedParser
    def self.parse(uri)
      SimpleRSS.parse(open(uri))
    end
  end
end
