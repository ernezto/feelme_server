require "spec_helper"

describe DailyMood do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:happy_count) }
  it { should validate_presence_of(:unhappy_count) }
  it { should validate_numericality_of(:happy_count)}
  it { should validate_numericality_of(:unhappy_count)}
  it { should validate_uniqueness_of(:date)}
end
