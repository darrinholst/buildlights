require 'hpricot'
require 'open-uri'

class XmlParser
  def self.parse(uri)
    Hpricot::XML(open(uri))
  end
end
