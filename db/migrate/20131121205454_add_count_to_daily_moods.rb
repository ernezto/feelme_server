class AddCountToDailyMoods < ActiveRecord::Migration
  def change
    change_table :daily_moods do |t|
      t.belongs_to :moods
    end
  end
end
