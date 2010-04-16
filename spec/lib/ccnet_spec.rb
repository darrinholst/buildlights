require 'spec_helper'

describe BuildLights::CcNet do
  it "should return failed jobs" do
    parser = parser_for(URI, ["job 1", "Failed"], ["job 2", "Failed"])
    scanner = BuildLights::CcNet.new(URI, parser)
    scanner.failed_jobs.should == ["job 1", "job 2"]
  end

  it "should not return any jobs when all successful" do
    parser = parser_for(URI, ["job 1", "Success"], ["job 2", "Success"])
    scanner = BuildLights::CcNet.new(URI, parser)
    scanner.failed_jobs.should == []
  end

  it "should only return failed jobs" do
    parser = parser_for(URI, ["job 1", "Success"], ["job 2", "FaileD"])
    scanner = BuildLights::CcNet.new(URI, parser)
    scanner.failed_jobs.should == ["job 2"]
  end

  def parser_for(uri, *jobs)
    projects = jobs.map do |j|
      project = mock
      project.should_receive(:[]).with(:name).and_return(j[0])
      project.should_receive(:[]).with(:lastBuildStatus).and_return(j[1])
      project
    end

    doc = mock()
    doc.should_receive(:search).with(:Project).and_return(projects)

    parser = mock()
    parser.should_receive(:parse).with(uri).and_return(doc)
    parser
  end
end