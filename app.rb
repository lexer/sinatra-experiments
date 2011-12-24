require 'sinatra'
require 'multi_json'

configure do
  set :logging, :true
end

post '/sms-handler' do
  logger.warn params
  status 200
  body(MultiJson.encode({:success => true}))
end
