class DailyMood < ActiveRecord::Base
  validates :date, presence: true
  validates :happy_count, presence: true, numericality: true
  validates :unhappy_count, presence: true, numericality: true
end
