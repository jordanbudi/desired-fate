require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/babyname' do
    @babyname = gender_select(params[:gender], params[:length], params[:strong], params[:unique], params[:outrageous], params[:meaningful])
    erb :babyname
  end

end