class DailyMood < ActiveRecord::Base
  belongs_to :mood

  validates :date, presence: true, uniqueness: { scope: :mood_id }
  validates :count, presence: true, numericality: true
  validates :mood, presence: true

  def self.today
    DailyMood.where("DATE(date) = ?", Date.today)
  end

  scope :current_week, -> { where(date: Date.today.beginning_of_week..Date.today.end_of_week) }

end
