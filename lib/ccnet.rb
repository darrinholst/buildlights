require 'hpricot'
require 'open-uri'

module BuildLights
  class CcNet
    def initialize(uri, parser = XmlParser)
      @doc = parser.parse(uri)
    end
  
    def failed_jobs
      @doc.search(:Project).map do |project|
        project[:name] if project[:lastBuildStatus] =~ /FAIL/i
      end.compact
    end
  end
  
  class XmlParser
    def self.parse(uri)
      Hpricot::XML(open(uri))
    end
  end
end

