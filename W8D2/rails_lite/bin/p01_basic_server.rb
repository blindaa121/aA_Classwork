require 'rack'

#This is create an app that we could give to Rack, that would return the text "Hello world!"
app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write(req.path)
  res.finish
end
#In order to actually have a functioning web application we need to actually give app to Rack
Rack::Server.start(
  app: app,
  Port: 3000
)