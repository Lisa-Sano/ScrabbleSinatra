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
    @word = params["game"]["word"]
    @score = Score.score(@word)
    erb :score
  end

  get '/score-many' do
    erb :score_many 
  end

  post '/score-many' do
    @words = params["game"]["word_list"]
    @scores = Score.score_many(@words)
    erb :score_many
  end

  run!
end