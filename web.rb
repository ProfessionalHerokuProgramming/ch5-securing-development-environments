# web.rb:
require 'sinatra'
get '/' do
     "Hello, " << ENV['NAME']
end

