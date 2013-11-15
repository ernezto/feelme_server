class DailyMoodsController < ApplicationController
  def new
    @daily_mood = DailyMood.new
  end

  def create
    @daily_mood = DailyMood.new(daily_mood_params)
    if @daily_mood.valid?
      @daily_mood.save
      flash[:success] = "Registered!"
      redirect_to action: "new"
    else
      render action: "new"
    end
  end

  def daily_moods
    daily_moods = DailyMood.today
    if (daily_moods.nil?)
      render :json => {}.to_json
    else
      render :json => {happy_value: daily_moods.happy_count, unhappy_value: daily_moods.unhappy_count}.to_json
    end
  end

  private
  def daily_mood_params
    params.require(:daily_mood).permit(:happy_count, :unhappy_count, :date)
  end
end
