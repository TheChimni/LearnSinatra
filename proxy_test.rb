require_relative 'proxy'
require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_root_path
    get '/'
    assert_equal 200, last_response.status
    assert_equal 'welcome', last_response.body
  end

  def test_not_found
    get '/not_a_path'
    assert_equal 404, last_response.status
  end

  def test_hello_world_path
    get '/hello_world'
    assert_equal 200, last_response.status
    assert_equal 'hello world', last_response.body
  end
end