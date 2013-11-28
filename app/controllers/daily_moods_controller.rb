class DailyMoodsController < ApplicationController
  def new
    @daily_mood_vm = DailyMoodViewModel.new(Mood.all)
  end

  def create
    @daily_mood_vm = DailyMoodViewModel.new(Mood.all)
    @daily_mood_vm.attributes = params[:daily_mood_view_model]
    if @daily_mood_vm.validate!
      @daily_mood_vm.save
      flash.now[:success] = "Registered!"
      redirect_to action: "new"
    else
      render action: "new"
    end
  end

  def today
    daily_moods = DailyMood.today
    if (daily_moods.nil?)
      render :json => {}.to_json
    else
      render :json => {happy_value: daily_moods.happy_count, unhappy_value: daily_moods.unhappy_count}.to_json
    end
  end

  def current_week
    @current_week_moods = DailyMood.current_week 

    render formats: [:json]
  end

  private
  def daily_mood_params
    params.require(:daily_mood_view_model).permit(:moods, :date)
  end
end
