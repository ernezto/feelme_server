class MoodsController < ApplicationController
  def create
    unhappy_moods = params[:unhappy].to_i
    happy_moods = params[:happy].to_i

    unhappy_moods.times { Mood.create(date: params[:date], vote_value: 0) }
    happy_moods.times { Mood.create(date: params[:date], vote_value: 1) }
  end
end
