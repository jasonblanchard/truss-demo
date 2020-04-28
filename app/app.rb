require 'sinatra/base'
require 'sinatra/json'

class TrussDemo < Sinatra::Base
  set :bind, '0.0.0.0'

  def self.run!
    unless ENV['RUN_TRUSS_DEMO']
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
