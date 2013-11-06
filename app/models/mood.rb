class Mood < ActiveRecord::Base
  validates :date, presence: true
  validates :vote_value, presence: true
end
