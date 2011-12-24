require 'sinatra'
require 'multi_json'

post '/sms-handler' do
  puts params
  status 200
  body(MultiJson.encode({:success => true}))
end
