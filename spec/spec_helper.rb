ENV['RACK_ENV'] = 'test'

require 'sinatra'
require 'bundler'
Bundler.require

# require testing components
require 'rack/test'
require 'minitest/autorun'

# require application components
require './pokedex_app.rb'
require 'json'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end
class BaseSpec < Minitest::Spec
  def self.expand_path(path)
    File.expand_path(path, __FILE__)
  end
end

class PokedexAppSpec < BaseSpec
  include Rack::Test::Methods

  before { app.views = './views' }

  def app
    PokedexApp
  end
end
