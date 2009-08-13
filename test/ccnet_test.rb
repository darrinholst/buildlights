require 'test_helper'

class CcNetTest < Test::Unit::TestCase
  URI = "some uri"
  
  def test_failed_jobs
    parser = parser_for(URI, ["job 1", "Failed"], ["job 2", "Failed"])
    scanner = BuildLights::CcNet.new(URI, parser)
    assert_equal(["job 1", "job 2"], scanner.failed_jobs)
  end

  def test_successful_jobs
    parser = parser_for(URI, ["job 1", "Success"], ["job 2", "Success"])
    scanner = BuildLights::CcNet.new(URI, parser)
    assert_equal([], scanner.failed_jobs)
  end

  def test_mixed_jobs
    parser = parser_for(URI, ["job 1", "Success"], ["job 2", "Failed"])
    scanner = BuildLights::CcNet.new(URI, parser)
    assert_equal(["job 2"], scanner.failed_jobs)
  end

  def test_mixed_case
    parser = parser_for(URI, ["job 1", "FAILED"], ["job 2", "SUCCESS"], ["job 3", "FAIL"])
    scanner = BuildLights::CcNet.new(URI, parser)
    assert_equal(["job 1", "job 3"], scanner.failed_jobs)
  end
      
  private

  def parser_for(uri, *jobs)
    projects = jobs.map do |j|
      project = mock()
      project.stubs(:[]).with(:name).returns(j[0])
      project.stubs(:[]).with(:lastBuildStatus).returns(j[1])
      project
    end

    doc = mock()
    doc.expects(:search).with(:Project).returns(projects)

    parser = mock()
    parser.expects(:parse).with(uri).returns(doc)
    parser
  end
end