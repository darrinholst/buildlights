require 'test_helper'
require 'hudson_feed_scanner'

class HudsonFeedScannerTest < Test::Unit::TestCase
  URI = "some uri"

  def test_all_successful
    parser = feed_parser_for(URI, "job 1 #1 (SUCCESS)", "job 2 #1 (SUCCESS)")
    scanner = HudsonFeedScanner.new(URI, parser)
    assert_equal([], scanner.failed_jobs)
  end
    
  def test_all_failed
    parser = feed_parser_for(URI, "job 1 #1 (FAILED)", "job 2 #1 (FAILED)")
    scanner = HudsonFeedScanner.new(URI, parser)
    assert_equal(['job 1', 'job 2'], scanner.failed_jobs)
  end

  def test_mixed
    parser = feed_parser_for(URI, "job 1 #1 (SUCCESS)", "job 2 #1 (FAILED)", "job 3 #1 (SUCCESS)")
    scanner = HudsonFeedScanner.new(URI, parser)
    assert_equal(['job 2'], scanner.failed_jobs)
  end

  def test_mixed_with_lower_case
    parser = feed_parser_for(URI, "job 1 #1 (success)", "job 2 #1 (failed)", "job 3 #1 (success)")
    scanner = HudsonFeedScanner.new(URI, parser)
    assert_equal(['job 2'], scanner.failed_jobs)
  end
    
  private
  
  def feed_parser_for(uri, *titles)
    entries = stub(:entries => titles.map {|t| stub(:title => t)})
    parser = mock()
    parser.expects(:parse).with(uri).returns(entries)
    parser
  end
end