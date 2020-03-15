require 'sinatra'

get '/' do
  erb :index
end

get '/authenticated' do
    erb :authn
end