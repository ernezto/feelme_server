require "spec_helper"

describe Mood do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end
end
