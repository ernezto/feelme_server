require "spec_helper"

describe MoodsController do

  describe "POST create" do

    it "should create 24 unhappy moods" do
      Mood.should_receive(:create).
        with(hash_including vote_value: 0).
        exactly(24).times
      post :create, unhappy_value: 24, happy_value: 0
    end

    it "should create 24 happy moods" do
      Mood.should_receive(:create).
        with(hash_including vote_value: 1).
        exactly(24).times
      post :create, happy_value: 24, unhappy_value: 0
    end

    it "should create the moods with the specified date" do
      date = DateTime.new - 1.day
      Mood.should_receive(:create).with(hash_including date: date.to_s)
      post :create, unhappy_value: 1, happy_value: 0, date: date
    end

    it "should display a flash after create votes" do
      date = DateTime.new - 1.day
      post :create, unhappy_value: 1, happy_value: 0, date: date
      flash[:notice].should == "Registered!"
    end

    it "should redirect to action new" do
      post :create, unhappy_value: 0, happy_value: 0, date: DateTime.new
      response.should redirect_to action: 'new'
    end
  end
end
