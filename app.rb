require 'sinatra'
require 'multi_json'

configure do
  set :logging, :true
end

post '/handle-sms' do
  logger.warn params
  code = /^jettaxi:(?<code>.*)$/.match(params["mes"])[:code].strip
  logger.warn code
  status 200
  body(MultiJson.encode({:success => true}))
end
