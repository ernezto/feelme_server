require "spec_helper"

describe DailyMood do
  describe "validations" do
    it { should validate_presence_of(:date) }
    it { should validate_uniqueness_of(:date)}
    it { should belong_to(:mood) }
    it { should validate_presence_of(:mood) }
    it { should validate_presence_of(:count) }
    it { should validate_numericality_of(:count) }
  end

  describe "#today" do
    it "should return last daily mood by date" do
      today = DateTime.now
      mood = Mood.create(name: "Triste")
      yesterday = today - 1.day
      today_mood = DailyMood.create(count: 6, mood: mood, date: today)
      yesterday_mood = DailyMood.create(count: 7, mood: mood, date: yesterday)
      DailyMood.today.should == today_mood
    end
  end

  describe "#current_week" do
    it "returns daily_moods for the current week" do
      mood = Mood.create(name: "Triste")
      monday_mood = DailyMood.create(count: 1, mood: mood, date: DateTime.new(2013, 11, 4))
      tuesday_mood = DailyMood.create(count: 1, mood: mood, date: DateTime.new(2013, 11, 5))
      friday_mood = DailyMood.create(count: 1, mood: mood, date: DateTime.new(2013, 11, 8))
      extra_mood = DailyMood.create(count: 1, mood: mood, date: DateTime.new(2012, 10, 1))

      Date.stub(:today).and_return(DateTime.new(2013, 11, 8))
      DailyMood.current_week.should == [monday_mood, tuesday_mood, friday_mood]
    end
  end
end
