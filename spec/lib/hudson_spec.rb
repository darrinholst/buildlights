require 'spec_helper'

describe BuildLights::Hudson do
  it "should not show any failures when all successful" do
    parser = feed_parser_for(URI, "job 1 #1 (SUCCESS)", "job 2 #1 (SUCCESS)", "job 1 #1 (SUCCESS)", "job 2 #1 (SUCCESS)")
    scanner = BuildLights::Hudson.new(URI, parser)
    scanner.failed_jobs.should == []
  end

  it "should return all failed jobs" do
    parser = feed_parser_for(URI, "job 1 #1 (FAILED)", "job 2 #1 (FAILED)", "job 3 #1 (SUCCESS)")
    scanner = BuildLights::Hudson.new(URI, parser)
    scanner.failed_jobs.should == ["job 1", "job 2"]
  end

  it "should return just the latest failed jobs" do
    parser = feed_parser_for(URI, "job 1 #1 (FAILED)", "job 2 #2 (SUCCESS)", "job 2 #1 (FAILED)")
    scanner = BuildLights::Hudson.new(URI, parser)
    scanner.failed_jobs.should == ["job 1"]
  end

  it "should handle other failure messages" do
    parser = feed_parser_for(URI, "job 1 #1 (broken)", "job 2 #1 (brokern since foo)", "job 3 #1 (1 test failing)")
    scanner = BuildLights::Hudson.new(URI, parser)
    scanner.failed_jobs.should == ["job 1", "job 2", "job 3"]
  end

  def feed_parser_for(uri, *titles)
    entries = stub(:entries => titles.map {|t| stub(:title => t)})
    parser = mock
    parser.should_receive(:parse).with(uri).and_return(entries)
    parser
  end
end
