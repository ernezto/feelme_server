class DailyMood < ActiveRecord::Base
  belongs_to :mood

  validates :date, presence: true, uniqueness: true
  validates :mood, presence: true
  validates :count, presence: true, numericality: true

  def self.today
    DailyMood.where("DATE(date) = ?", Date.today).first
  end

  scope :current_week, -> { where(date: Date.today.beginning_of_week..Date.today.end_of_week) }
end
