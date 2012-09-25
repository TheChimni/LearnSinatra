# encoding: utf-8

require 'rubygems'
require 'sinatra'

configure do
  set :port, 4568
end

get '/' do
  puts 'Welcome to Proxy!'
end