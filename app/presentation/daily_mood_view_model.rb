class DailyMoodViewModel
  include ActiveModel::Model
  include ActiveModel::Validations

  has_many :daily_moods
  attr_accessor :date, :daily_moods
  validates :date, presence: true
  validates_associated :daily_moods

  def initialize(params = nil)
    return if params == nil
    @date = params[:date]
    @daily_moods = params[:daily_moods]
  end

end
