require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @letters = params[:letters]
    @answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    check = JSON.parse(open(url).read)
    final = JSON.parse(check)
      if final["found"] == true
    
        @result = 'Congratulations! This is a valid English word!'
      else
        @result = 'Sorry but this does not seem to be a valid English word !'
      end
    else
    @result = 'is not included in the grid'
    end
  end
end
