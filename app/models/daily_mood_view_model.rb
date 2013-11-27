class DailyMoodViewModel
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Naming

  attr_reader :daily_mood

  delegate :date=, :persisted?, to: :daily_mood

  def initialize(daily_mood, moods)
    @daily_mood = daily_mood
    @moods = moods
  end

  def date
    @daily_mood.date ||= DateTime.now
  end
end
