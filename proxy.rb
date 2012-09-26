# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'net/http'
require 'uri'

configure do
   set :port => 4568, :env => 'HTTP_X_API_KEY'
end

get '/' do
  'welcome to proxy'
  # uri = URI('/')
  uri =  URI.parse("http://localhost:4567")

  # uri.query = [uri.query, "api_key"].compact.join('?') 

  # puts uri

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  request['header-name'] = 'HTTP_X_API_KEY'
  puts request.to_s
  response = http.request(request)


  
  # res = Net::HTTP.start('localhost', 4568) do |h| 
  #   req = Net::HTTP::Get.new(uri.request_uri)

  #   # req.inspect()
  #   # req = h.get(uri.request_uri + "?api_key")
  #   # req.params 
  #   res1 = Net::HTTP.start('localhost', 4567) do |h1| 
  #     response = h1.request req
  #   end
  # end
end