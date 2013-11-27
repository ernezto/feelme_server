require "spec_helper"

describe DailyMood do
  describe "validations" do
    it { should validate_presence_of(:date) }
    it { should belong_to(:mood) }
    it { should validate_presence_of(:count) }
    it { should validate_numericality_of(:count)}
    it { should validate_uniqueness_of(:date).scoped_to(:mood_id) }
  end

  describe "#today" do
    it "should return last daily moods by date" do
      today = DateTime.now
      yesterday = today - 1.day
      mood = Mood.new
      today_mood = DailyMood.create(mood: mood,
                                    date: today,
                                   count: 3)
      yesterday_mood = DailyMood.create(mood: mood,
                                    date: yesterday,
                                   count: 10)
      DailyMood.today.should == [today_mood]
    end
  end

  describe "#current_week" do
    it "returns daily_moods for the current week" do
      mood = Mood.new
      monday_mood = DailyMood.create(mood: mood, date: DateTime.new(2013,11,4), count: 1)
      tuesday_mood =DailyMood.create(mood: mood, date: DateTime.new(2013,11,5), count: 1)
      friday_mood = DailyMood.create(mood: mood, date: DateTime.new(2013,11,8), count: 1)
      extra_mood = DailyMood.create(mood: mood, date: DateTime.new(2013,10, 1), count: 1)

      Date.stub(:today).and_return(DateTime.new(2013, 11, 8))
      DailyMood.current_week.should == [monday_mood,  tuesday_mood, friday_mood]
    end
  end
end
