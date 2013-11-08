class MoodsController < ApplicationController
  def new; end

  def create
    unhappy_moods = params[:unhappy_value].to_i || 0
    happy_moods = params[:happy_value].to_i || 0
    date = params[:date]
    moods = []

    unhappy_moods.times do 
      moods << Mood.new(date: date, vote_value: 0)
    end
    happy_moods.times do
      moods << Mood.new(date: date, vote_value: 1)
    end

    if moods.map(&:valid?).include? false
      @error = "Mood not valid"
    end

    moods.map(&:save)

    flash[:notice]="Registered!"
    redirect_to action: 'new'
  end
end
