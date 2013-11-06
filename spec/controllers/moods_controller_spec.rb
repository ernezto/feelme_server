require "spec_helper"

describe MoodsController do

  describe "POST create" do

    it "should create 24 unhappy moods" do
      Mood.should_receive(:create).
        with(hash_including vote_value: 0).
        exactly(24).times
      post :create, unhappy: 24, happy: 0
    end

    it "should create 24 happy moods" do
      Mood.should_receive(:create).
        with(hash_including vote_value: 1).
        exactly(24).times
      post :create, happy: 24, unhappy: 0
    end

    it "should create the moods with the specified date" do
      date = DateTime.new - 1.day
      Mood.should_receive(:create).with(hash_including date: date.to_s)
      post :create, unhappy: 1, happy: 0, date: date
    end
  end
end
