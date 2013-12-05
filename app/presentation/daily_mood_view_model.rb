class DailyMoodViewModel
  attr_reader :date, :daily_moods

  def initialize(params = nil)
    return if params == nil
    @date = params[:date]
    @daily_moods = params[:daily_moods]
  end

  def valid?
    return errors.messages.count == 0
  end

  def errors
    @errors = ActiveModel::Errors.new(self)
    @errors.add(:date, "can't be blank") if @date == nil
    return @errors
  end
end
