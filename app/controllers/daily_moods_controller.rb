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

  def today
    daily_mood = DailyMood.today
    render json: { happy_value: daily_mood.happy_count,
                   unhappy_value: daily_mood.unhappy_count }.to_json
  end

  private
  def daily_mood_params
    params.require(:daily_mood).permit(:happy_count, :unhappy_count, :date)
  end
end
