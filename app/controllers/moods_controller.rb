class MoodsController < ApplicationController
  def new; end

  def create
    begin
      if params[:happy_value].match(/^\d+$/) ||
         params[:unhappy_value].match(/^\d+$/)
        raise  ArgumentError,'Mood not valid'
      end

      unhappy_moods = params[:unhappy_value].to_i
      happy_moods = params[:happy_value].to_i
      date = params[:date]
      moods = []

      unhappy_moods.times do 
        moods << Mood.new(date: date, vote_value: 0)
      end

      happy_moods.times do
        moods << Mood.new(date: date, vote_value: 1)
      end

      if moods.map(&:valid?).include? false
        raise  ArgumentError,'Mood not valid'
      else
        moods.map(&:save)
        flash.now[:notice]="Registered!"
      end
      rescue ArgumentError
        flash.now[:error] = "Mood not valid"
    end  
    render "new"
  end
end
