module DailyMoodHelper
  def render_json_for current_week

    happy_moods = [0, 0, 0, 0, 0]
    unhappy_moods = [0, 0, 0, 0, 0]

    current_week.each do |daily_mood|
       happy_moods[daily_mood.date.wday-1]=daily_mood.happy_count
       unhappy_moods[daily_mood.date.wday-1]=daily_mood.unhappy_count
    end
    {
      happy_values: happy_moods,
      unhappy_values: unhappy_moods
    }.to_json
  end
end
