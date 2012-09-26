# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'net/http'
require 'uri'

configure do
   set :port => 4568
end

get '/*' do
  path = params[:splat].first
  uri = URI.parse("http://localhost:4567/#{path}")

  # Forward the client request to server after adding 'x-api-key' header 
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  request['X-API-Key'] = 'awesomeserver'
  response = http.request(request)
  response.body
end
