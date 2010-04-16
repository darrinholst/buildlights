require 'spec_helper'

describe BuildLights::Lights do
  it "should turn lights on when some jobs have failed" do
    impl = mock
    impl.should_receive(:turn_on).with(BuildLights::Lights::RED)
    impl.should_receive(:turn_off).with(BuildLights::Lights::GREEN)
    BuildLights::Lights.new(impl).failed
  end

  it "should turn lights off when all jobs are successful" do
    impl = mock
    impl.should_receive(:turn_on).with(BuildLights::Lights::GREEN)
    impl.should_receive(:turn_off).with(BuildLights::Lights::RED)
    BuildLights::Lights.new(impl).success
  end
end
