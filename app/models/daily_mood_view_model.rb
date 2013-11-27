class DailyMoodViewModel
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Naming

  def initialize(daily_mood, moods)
    @daily_mood = daily_mood
    @moods = moods
  end
end
