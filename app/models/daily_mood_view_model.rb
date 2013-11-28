class DailyMoodViewModel
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_reader :date, :daily_moods, :errors

  def initialize(params = nil)
    @date = DateTime.now
    @errors = ActiveModel::Errors.new(self)
    @daily_moods = []
    mapping params
  end

  def persisted?
    false
  end

  def save
    DailyMood.transaction do
      @daily_moods.each do |daily_mood|
        daily_mood.save
      end
    end
  end

  private
  def mapping(params)
    return if params == nil
    moods = params[:daily_moods] || []
    moods.each { |m| @daily_moods << DailyMood.new(m) }
    @daily_moods.each{ |dm| dm.date = params[:date] }
  end
end
