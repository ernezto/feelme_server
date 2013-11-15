require "spec_helper"

describe DailyMood do
  describe "validations" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:happy_count) }
    it { should validate_presence_of(:unhappy_count) }
    it { should validate_numericality_of(:happy_count)}
    it { should validate_numericality_of(:unhappy_count)}
    it { should validate_uniqueness_of(:date)}
  end

  describe "scopes" do
    it "should return last daily mood by date" do
      today = DateTime.now
      yesterday = today - 1.day
      today_mood = DailyMood.create(happy_count: 6,
                                    unhappy_count: 4,
                                    date: today)
      yesterday_mood = DailyMood.create(happy_count: 7,
                                        unhappy_count: 5,
                                        date: yesterday)
      DailyMood.today.should == today_mood
    end
  end
end
