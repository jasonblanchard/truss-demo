require 'sinatra/base'
require 'sinatra/custom_logger'
require 'sinatra/json'
require 'logger'

class TrussDemo < Sinatra::Base
  set :bind, '0.0.0.0'

  helpers Sinatra::CustomLogger

  configure :development, :production do
    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG if development?
    set :logger, logger
  end

  def self.run!
    unless ENV['RUN_TRUSS_DEMO']
      logger.error("Environment variable RUN_TRUSS_DEMO must be set!")

      exit
    end

    super
  end

  get '/demo/echo' do
    json message: params[:message]
  end

  get '/healthz' do
    json healthy: true
  end
end

TrussDemo.run!
