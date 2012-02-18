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
  status 200
  body(MultiJson.encode(params))  
end

post '/return' do
  logger.info "retrun"
  logger.info params
  status 200
  body(MultiJson.encode(params))  
end

post '/cancel' do
  logger.info "cancel"
  logger.info params
  status 200
  body(MultiJson.encode(params))  
end

get '/contest' do
  logger.info "request_ip: #{request.ip}"
  logger.info "x forwarded: #{env["HTTP_X_FORWARDED_FOR"]}"
  logger.info "remote addr: #{env['REMOTE_ADDR']}"

  body(MultiJson.encode({:success => true}))

  #@client_ip = request.remote_ip
  #@remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
  #@my_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_addr
  #@ip_addr = request.env['REMOTE_ADDR']

end