require "spec_helper"

describe MoodsController do

  describe "POST create" do

    it "should save 24 unhappy moods" do
      expect {
        post :create, unhappy_value: 24, happy_value: 0, date: DateTime.new
      }.to change{ Mood.count }.by(24)
    end

    it "should save 24 happy moods" do
      expect {
        post :create, unhappy_value: 0, happy_value: 24, date: DateTime.new
      }.to change{ Mood.count }.by(24)
    end

    it "should create the moods with the specified date" do
      date = DateTime.new - 1.day
      mood = Mood.new(date:date.to_s, vote_value: 0)
      Mood.should_receive(:new).
        with(hash_including date: date.to_s).
        and_return(mood)
      post :create, unhappy_value: 1, happy_value: 0, date: date
    end

    it "should display a flash after create votes" do
      date = DateTime.new - 1.day
      post :create, unhappy_value: 1, happy_value: 0, date: date
      flash[:notice].should == "Registered!"
    end

    it "should render #new after create action" do
      post :create, unhappy_value: 0, happy_value: 0
        response.should render_template("new")
    end

    it "should not save if Mood is invalid" do
      Mood.any_instance.
        should_not_receive(:save)
      post :create, unhappy_value: 1, happy_value: 0
    end

    it "should display a flash that Mood is invalid" do
      post :create, unhappy_value: 1, happy_value: 0
      flash[:error].should == "Mood not valid"
    end
    
  end
end
