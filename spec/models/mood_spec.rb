require "spec_helper"

describe Mood do

  it "should require a date" do
    Mood.create(vote_value: 1).should_not be_valid
  end

  it "should require a vote_value" do
    Mood.create(date:Date.new).should_not be_valid
  end
end
