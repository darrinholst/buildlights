require 'xml_parser'

class BuildLights::CcNetXmlScanner
  def initialize(uri, parser = BuildLights::XmlParser)
    @doc = parser.parse(uri)
  end
  
  def failed_jobs
    @doc.search(:Project).map do |project|
      project[:name] if project[:lastBuildStatus] =~ /FAIL/i
    end.compact
  end
end
