require 'sinatra'
require_relative 'lib/score'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @score = Score.score(params["game"]["word"])
    erb :score
  end

  get '/score-many' do
    erb :score_many
  end

  post '/score-many' do
    @scores = Score.score_many(params["game"]["word_list"])
    erb :score_many
  end

  run!
end