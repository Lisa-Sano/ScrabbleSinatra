require 'sinatra'
require_relative 'lib/score'

class MyApp < Sinatra::Base

  get '/' do
    @css = "/stylesheets/styles_index.css"
    erb :index
  end

  get '/score' do
    erb :score
  end

  get '/score/:word' do
    @word = params[:word]
    @score = Score.score(@word)
    erb :score
  end

  post '/score' do
    @word = params["game"]["word"]
    @score = Score.score(@word)
    @letter_scores = Score.letter_score(@word)
    erb :score
  end

  get '/score-many' do
    erb :score_many 
  end

  post '/score-many' do
    @words = params["game"]["word_list"]
    @scores = Score.score_many(@words)
    @letter_scores = @words.split(" ").map { |word| Score.letter_score(word) }
    erb :score_many
  end

  run!
end