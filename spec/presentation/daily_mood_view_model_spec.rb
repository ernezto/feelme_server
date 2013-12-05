require "spec_helper"

describe DailyMoodViewModel do
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

  it "should return false when created with no date" do
    daily_mood_vm = create_with_invalid_date
    daily_mood_vm.valid?.should be_false
  end

  it "should return true when created with date" do
    daily_mood_vm = DailyMoodViewModel.new(date: DateTime.now, daily_moods: nil)
    daily_mood_vm.valid?.should be_true
  end

  it "should has error message for date field when is not valid" do
    daily_mood_vm = create_with_invalid_date
    daily_mood_vm.errors.messages.should include(
      date: ["can't be blank"]
    )
  end

  it "should not have error message for date field when valid" do
    daily_mood_vm = DailyMoodViewModel.new(date: DateTime.now, daily_moods: nil)
    daily_mood_vm.errors.should_not have_key(:date)
  end

  def create_with_invalid_date
    date = nil
    DailyMoodViewModel.new(date: date, daily_moods: nil)
  end
end
