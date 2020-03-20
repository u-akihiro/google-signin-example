require 'sinatra'
require 'google-id-token'
require 'json'
require 'logger'

get '/' do
  erb :index
end

post '/verify' do
    content_type :json

    token = params[:token]
    logger.info token
    validator = GoogleIDToken::Validator.new
    begin
      payload = validator.check(token, ENV['CLIENT_ID'])
      payload.to_json
    rescue GoogleIDToken::ValidationError => e
      {message: "Cannot validate: #{e}"}.to_json
    end
end

get '/form' do
  erb :form
end