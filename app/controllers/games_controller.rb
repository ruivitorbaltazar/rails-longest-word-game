require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    word = params[:word]
    letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    check = JSON.parse(open(url).read)
    r1 = "Sorry but #{word.upcase} can’t be built out of #{letters.upcase}."
    r2 = "Congratulations! #{word.upcase} is a valid English word!"
    r3 = "Sorry but #{word.upcase} does not seem to be a valid English word..."
    @response = check['length'] ? r2 : r3
    @response = r1 unless (word.chars - letters.split).empty?
  end
end
