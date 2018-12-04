# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'eventmachine'
require 'thin'

EM.run do
  server  = 'thin'
  host    = '0.0.0.0'
  port    = ENV['PORT'] || '9393'
  app     = App::Inbox.new

  puts "Starting message seeder"
  s = Seeder.new
  EM.add_periodic_timer(5) do
    s.create_random_email
  end

  dispatch = Rack::Builder.app do
    map '/' do
      run app
    end
  end

  Rack::Server.start({
    app:    dispatch,
    server: server,
    signals: false,
    Host:   host,
    Port:   port
  })
end
