require 'xml_parser'

class CcNetXmlScanner
  def initialize(uri, parser = XmlParser)
    @doc = parser.parse(uri)
  end
  
  def failed_jobs
    @doc.search(:Project).map do |project|
      project[:name] if project[:lastBuildStatus] =~ /FAIL/i
    end.compact
  end
end
