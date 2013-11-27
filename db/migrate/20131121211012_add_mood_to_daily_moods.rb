class AddMoodToDailyMoods < ActiveRecord::Migration
  def change
    add_column :daily_moods, :mood_id, :integer
  end
end
