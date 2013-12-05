class AddMoodIdIndex < ActiveRecord::Migration
  def change
    add_index :daily_moods, :mood_id
  end
end
