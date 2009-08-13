require 'simple-rss'
require 'open-uri'

module BuildLights
  class Hudson
    def initialize(uri, parser = FeedParser)
      @feed = parser.parse uri
    end
  
    def failed_jobs
      @feed.entries.each.map do |entry|
        match = /(.*) #\d+ (.*)/.match(entry.title)
        raise "Invalid rss title #{entry.title}" unless match
        match[1] if /FAIL/i.match(match[2])
      end.compact
    end
  end
  
  class FeedParser
    def self.parse(uri)
      SimpleRSS.parse(open(uri))
    end
  end
end
