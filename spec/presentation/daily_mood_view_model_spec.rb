require "spec_helper"

describe DailyMoodViewModel do

  describe "validations" do
    it { should validate_presence_of :date}
  end

  it "should have a date and daily_moods when params provided" do
    date = DateTime.now
    daily_moods = daily_moods = [DailyMood.new(count: 10, mood_id: 1)]
    params = { date: date, daily_moods: daily_moods }
    daily_mood_vm = DailyMoodViewModel.new(params)
    daily_mood_vm.date.should == date
    daily_mood_vm.daily_moods.should == daily_moods
  end

  it "should create an empty instance if params is nil" do
    DailyMoodViewModel.new.should be_an_instance_of DailyMoodViewModel
  end

end
