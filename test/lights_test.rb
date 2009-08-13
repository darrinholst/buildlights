require 'test_helper'

class LightsTest < Test::Unit::TestCase
  def test_successful_builds
    impl = mock()
    impl.expects(:turn_on).with(1)
    impl.expects(:turn_off).with(2)
    
    BuildLights::Lights.new(impl).success
  end
    
  def test_failed_builds
    impl = mock()
    impl.expects(:turn_on).with(2)
    impl.expects(:turn_off).with(1)
    
    BuildLights::Lights.new(impl).failed
  end
end