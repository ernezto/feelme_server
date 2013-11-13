class DailyMoodsController < ApplicationController
  def new
    @daily_mood = DailyMood.new
  end

  def create
    @daily_mood = DailyMood.new(daily_mood_params)
    if @daily_mood.valid?
      @daily_mood.save
      flash[:success] = "Registered!"
    end
    render "new"
  end

  private
  def daily_mood_params
    params.require(:daily_mood).permit(:happy_count, :unhappy_count, :date)
  end
end
