require "spec_helper"

describe MoodsController do

  describe "POST create" do

    it "should save 24 unhappy moods" do
      count = 0
      Mood.any_instance.stub(:save) do
          count+=1
      end
      post :create, unhappy_value: 24, happy_value: 0
      count.should == 24
    end

    it "should save 24 happy moods" do
      count =0  
      Mood.any_instance.stub(:save) do
        count+=1
      end
      post :create, happy_value: 24, unhappy_value: 0
      count.should == 24
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

    it "should redirect to action new" do
      post :create, unhappy_value: 0, happy_value: 0, date: DateTime.new
      response.should redirect_to action: 'new'
    end

    it "should display error message when a date is not provided" do
      post :create, unhappy_value: 1, happy_value: 0
      assigns(:error).should == "Mood not valid"
    end
  end
end
