class DailyMoodViewModel
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_reader :date, :moods, :errors

  def initialize(moods)
    @moods = moods
    @date = DateTime.now
    @save_list = []
    @errors = ActiveModel::Errors.new(self)
  end

  def attributes=(attributes)
    moods = attributes[:moods] || []
    moods.each do |k, v|
      @save_list << DailyMood.new(date: attributes[:date], count: v, mood_id: k)
    end
  end

  def persisted?
    @save_list.count == @moods.count &&
   !@save_list.map(&:persisted?).include?(false)
  end

  def validate!
    puts "Validates runs"
    @errors.add(:moods, "Should be more than one") if @moods == nil || @moods.count == 0
    @errors.add(:date, "Can not be nil") if @date == nil
    @save_list.each do |daily_mood|
      @errors.add(:mood, "Can not be nil") if daily_mood.count == nil
    end
    errors.count == 0
  end

  def save
    DailyMood.transaction do
      @save_list.each do |daily_mood|
        daily_mood.save!
      end
    end
  end
end
