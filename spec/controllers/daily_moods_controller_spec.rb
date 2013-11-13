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

    xit "should display a flash after create votes" do
      create_valid_mood
      flash[:notice].should == "Registered!"
    end

    xit "should render #new after create action" do
      post :create, unhappy_value: 0, happy_value: 0
        response.should render_template("new")
    end

    xit "should not save if Mood is invalid" do
      Mood.any_instance.
        should_not_receive(:save)
      post :create, unhappy_value: 1, happy_value: 0
    end

    xit "should display a flash that Mood is invalid" do
      post :create, unhappy_value: 1, happy_value: 0
      flash[:error].should == "Mood not valid"
    end

    xit "should have only a message for completed action" do
      create_valid_mood 
      post :create, unhappy_value: 1, happy_value: 0
      flash[:notice].should == nil
      flash[:error].should == "Mood not valid"
    end

    xit "should display an error when happy_value is invalid" do
      date = DateTime.new - 1.day
      post :create, unhappy_value: 1, happy_value: "a", date: date
      flash[:error].should == "Mood not valid"
    end

    xit "should display an error when unhappy_value is invalid" do
      date = DateTime.new - 1.day
      post :create, unhappy_value: "a", happy_value: 1, date: date
      flash[:error].should == "Mood not valid"
    end

    def create_valid_mood
      date = DateTime.new - 1.day
      post :create, unhappy_value: 1, happy_value: 0, date: date
    end
  end
end
