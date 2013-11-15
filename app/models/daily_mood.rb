class DailyMood < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true
  validates :happy_count, presence: true, numericality: true
  validates :unhappy_count, presence: true, numericality: true

  scope :today, -> { where("DATE(date) = ?", Date.today).first }
  scope :current_week, -> { where(date: Date.today.beginning_of_week..Date.today.end_of_week) }
end
