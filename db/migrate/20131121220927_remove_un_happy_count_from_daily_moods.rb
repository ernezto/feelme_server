class RemoveUnHappyCountFromDailyMoods < ActiveRecord::Migration
  def change
    remove_column :daily_moods, :unhappy_count, :integer
  end
end
