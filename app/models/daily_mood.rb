class DailyMood < ActiveRecord::Base
  validates :date, presence: true, uniqueness: true
  validates :happy_count, presence: true, numericality: true
  validates :unhappy_count, presence: true, numericality: true

  def self.today
    DailyMood.where("DATE(date) = ?", Date.today).first
  end
end
