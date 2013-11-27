class RemoveHappyCountFromDailyMoods < ActiveRecord::Migration
  def change
    remove_column :daily_moods, :happy_count, :integer
  end
end
