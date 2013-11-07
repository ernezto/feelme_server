class MoodsController < ApplicationController
  def new
  end

  def create
    unhappy_moods = params[:unhappy_value].to_i
    happy_moods = params[:happy_value].to_i

    unhappy_moods.times { Mood.create(date: params[:date], vote_value: 0) }
    happy_moods.times { Mood.create(date: params[:date], vote_value: 1) }
    flash[:notice]="Registered!"
    redirect_to action: 'new'
  end
end
