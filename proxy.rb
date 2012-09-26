# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'net/http'
require 'uri'

configure do
   set :port => 4568
end

get '/' do
  uri =  URI.parse("http://localhost:4567")

  # Forward the client request to server after adding 'x-api-key' header 
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  request['X-API-Key'] = 'awesomeserver'
  response = http.request(request)
  response.body
end

get '/hello_world' do
  uri =  URI.parse("http://localhost:4567/hello_world?api_key=awesomeserver")

  # Forward the client request to server after adding the api_key param
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  # request['X-API-Key'] = 'awesomeserver'
  response = http.request(request)
  response.body
end