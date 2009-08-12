require 'feed_parser'

class HudsonFeedScanner
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
