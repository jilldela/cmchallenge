require 'rack'
require 'json'
require_relative './lib/router.rb'
require 'byebug'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new  
  Router.run(req, res)
  res.finish
end

Rack::Server.start(
 app: app,
 Port: 3000
)