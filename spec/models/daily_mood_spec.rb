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

  describe "#today" do
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

  describe "#current_week" do
    it "returns daily_moods for the current week" do
      monday_mood = DailyMood.create(happy_count: 1, unhappy_count: 1, date: DateTime.new(2013, 11, 4))
      tuesday_mood = DailyMood.create(happy_count: 1, unhappy_count: 1, date: DateTime.new(2013, 11, 5))
      friday_mood = DailyMood.create(happy_count: 1, unhappy_count: 1, date: DateTime.new(2013, 11, 8))
      extra_mood = DailyMood.create(happy_count: 1, unhappy_count: 1, date: DateTime.new(2012, 10, 1))

      Date.stub(:today).and_return(DateTime.new(2013, 11, 8))
      DailyMood.current_week.should == [monday_mood, tuesday_mood, friday_mood]
    end
  end
end
