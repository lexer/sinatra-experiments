require 'sinatra'
require 'multi_json'

configure do
  set :logging, :true
end

post '/handle-sms' do
  logger.info params
  code = /^jettaxi:(?<code>.*)$/i.match(params["mes"])[:code].strip
  logger.info code
  status 200
  body(MultiJson.encode({:success => true}))
end

post '/ipn' do
  logger.info params
  
end