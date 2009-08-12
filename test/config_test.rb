require 'test_helper'
require 'config'
require 'tempfile'
require 'fileutils'

class BuildLights::Config
  HOME_LOCATION = File.join(Dir.tmpdir, "buildlights_unittests", "home")
  SYSTEM_LOCATION = File.join(Dir.tmpdir, "buildlights_unittests", "system")
end

class ConfigTest < Test::Unit::TestCase
  def setup
    FileUtils.rm_rf BuildLights::Config::HOME_LOCATION
    FileUtils.rm_rf BuildLights::Config::SYSTEM_LOCATION
    FileUtils.mkdir_p BuildLights::Config::HOME_LOCATION
    FileUtils.mkdir_p BuildLights::Config::SYSTEM_LOCATION
  end
  
  def test_no_config_found
    assert_raise RuntimeError do
      BuildLights::Config.new
    end
  end
  
  def test_config_found_in_home_dir
    add_file_to_home
    assert_home_file_used
  end

  def test_config_found_in_home_dir_is_used_first
    add_file_to_home
    add_file_to_system
    assert_home_file_used
  end

  def test_config_found_in_system_dir
    add_file_to_system
    assert_system_file_used
  end
  
  private
  
  def add_file_to_home
    File.open(File.join(BuildLights::Config::HOME_LOCATION, ".buildlights"), "w") do |f|
      f.puts "ccnet_url: ccnet_url_from_home"
      f.puts "hudson_url: hudson_url_from_home"
    end
  end

  def add_file_to_system
    File.open(File.join(BuildLights::Config::SYSTEM_LOCATION, ".buildlights"), "w") do |f|
      f.puts "ccnet_url: ccnet_url_from_system"
      f.puts "hudson_url: hudson_url_from_system"
    end
  end
  
  def assert_home_file_used
    assert_attributes(BuildLights::Config.new, "home")
  end

  def assert_system_file_used
    assert_attributes(BuildLights::Config.new, "system")
  end
  
  def assert_attributes(config, home_or_system)
    assert_equal("hudson_url_from_#{home_or_system}", config.hudson_url)
    assert_equal("ccnet_url_from_#{home_or_system}", config.ccnet_url)
    assert_equal(nil, config.foo_url)
  end
end