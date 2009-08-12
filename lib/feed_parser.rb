require 'simple-rss'
require 'open-uri'

class FeedParser
  def self.parse(uri)
    SimpleRSS.parse(open(uri))
  end
end