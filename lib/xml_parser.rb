require 'hpricot'
require 'open-uri'

class BuildLights::XmlParser
  def self.parse(uri)
    Hpricot::XML(open(uri))
  end
end
