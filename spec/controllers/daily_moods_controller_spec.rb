require "spec_helper"

describe DailyMoodsController do

  describe "GET new" do
    it "should create a new daily mood" do
      get :new
      assigns(:daily_mood).should be_an_instance_of DailyMood
    end

  end

  describe "POST create" do
    it "should assigns a daily mood" do
      mood = DailyMood.new
      DailyMood.stub(:new).and_return(mood)
      post :create, daily_mood: { unhappy_count: "a", happy_count: 15, date: DateTime.now }
      assigns(:daily_mood).should eq(mood)
    end

    it "should create a daily mood with an unhappy_count of 24" do
      mood = DailyMood.new
      DailyMood.should_receive(:new).with(hash_including unhappy_count: "24").and_return(mood)
      post :create, daily_mood: { unhappy_count: 24 }
    end

    it "should create a daily mood with an happy_count of 10" do
      mood = DailyMood.new
      DailyMood.should_receive(:new).with(hash_including happy_count: "10").and_return(mood)
      post :create, daily_mood: { happy_count: 10 }
    end

    it "should save a valid daily mood" do
      expect {
        post :create, daily_mood: { unhappy_count: 10, happy_count: 15, date: DateTime.now }
      }.to change{ DailyMood.count }.by(1)
    end

    it "should not save a daily mood with an invalid unhappy_count" do
      DailyMood.any_instance.should_not_receive(:save)
      post :create, daily_mood: { unhappy_count: "a", happy_count: 15, date: DateTime.now }
    end

    it "should display Registered! message" do
      post :create, daily_mood: { unhappy_count: 10, happy_count: 15, date: DateTime.now }
      flash[:success].should =="Registered!"
    end

    it "should not display Registered! message for invalid Mood" do
      post :create, daily_mood: { unhappy_count: "a", happy_count: 15, date: DateTime.now }
      flash[:success].should_not =="Registered!"
    end
  end
end