# web.rb
require 'sinatra'
helpers do
        def protected!
        unless ENV['RACK_ENV'] != 'staging' || authorized?
                response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
                throw(:halt, [401, "Not authorized\n"])
        end
        end
        def authorized?
        @auth ||=  Rack::Auth::Basic::Request.new(request.env)
        @auth.provided? && @auth.basic? && @auth.credentials && 
          @auth.credentials == ['alladin', 'opensesame']
        end
end

get '/' do
        protected!
        "Hello, " << ENV['NAME']
end
