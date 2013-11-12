class CreateDailyMood < ActiveRecord::Migration
  def change
    create_table :daily_moods do |t|
      t.datetime :date
      t.integer :happy_count
      t.integer :unhappy_count
    end
  end
end
