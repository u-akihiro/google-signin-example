require 'sinatra'
require 'google-id-token'
require 'json'

get '/' do
  erb :index
end

post '/verify' do
    content_type :json

    token = params[:token]
    validator = GoogleIDToken::Validator.new
    begin
      payload = validator.check(token, ENV['CLIENT_ID'])
      payload.to_json
    rescue GoogleIDToken::ValidationError => e
      report "Cannot validate: #{e}"
    end
end