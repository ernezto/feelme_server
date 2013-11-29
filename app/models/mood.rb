class Mood < ActiveRecord::Base
  validates :name, presence: true
end
