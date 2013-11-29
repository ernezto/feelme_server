class AddTableDailyMood < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :name
      t.string :icon_path
      t.timestamps
    end

    create_table :daily_moods do |t|
      t.belongs_to :mood
      t.integer :count
      t.datetime :date
      t.timestamps
    end
  end
end
