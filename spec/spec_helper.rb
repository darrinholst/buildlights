require 'rubygems'
require 'bundler'
Bundler.setup
Bundler.require :default, :test
$LOAD_PATH << File.join(File.dirname(__FILE__),"..","lib")
require 'buildlights'