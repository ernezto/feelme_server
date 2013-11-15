require "spec_helper"

describe DailyMoodHelper do

  describe "#render_json_for" do
    it "returns two arrays of zeroes if there is no data for the week" do
      render_json_for([]).should == {happy_values: [0, 0, 0, 0, 0], 
                                     unhappy_values: [0, 0, 0, 0, 0]}.to_json

    end
    it "return current week data" do
      current_week = [DailyMood.new(happy_count: 1, unhappy_count: 5, date: DateTime.new(2013,11,4)),
      DailyMood.new(happy_count: 2, unhappy_count: 4, date: DateTime.new(2013,11,5)),
      DailyMood.new(happy_count: 3, unhappy_count: 3, date: DateTime.new(2013,11,6)),
      DailyMood.new(happy_count: 4, unhappy_count: 2, date: DateTime.new(2013,11,8))]
      render_json_for(current_week).should == {happy_values: [1, 2, 3, 0, 4], 
                                     unhappy_values: [5, 4, 3, 0, 2]}.to_json
    end

    it "return current week data" do
      current_week = [
      DailyMood.new(happy_count: 2, unhappy_count: 4, date: DateTime.new(2013,11,5)),
      DailyMood.new(happy_count: 4, unhappy_count: 2, date: DateTime.new(2013,11,8))]
      render_json_for(current_week).should == {happy_values: [0, 2, 0, 0, 4], 
                                     unhappy_values: [0, 4, 0, 0, 2]}.to_json
    end
  end
end
