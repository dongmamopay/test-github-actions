# frozen_string_literal: true

require 'sinatra/base'

class App < Sinatra::Base
  set :server, :puma
  set :bind, '0.0.0.0'
  set :port, 3001
  set :environment, ENV.fetch('APP_ENV', 'development')
  set :logging, Logger::DEBUG

  post '/webhook' do
    logger.info '================== REQUEST START =================='

    request.body.rewind

    request_payload = JSON.parse(request.body.read, symbolize_names: true)

    logger.info '================== REQUEST END =================='
  end
end
