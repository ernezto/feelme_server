class CreateMoodTable < ActiveRecord::Migration
  def change
    create_table :mood_tables do |t|
      t.string :name
      t.string :icon_path
    end
  end
end
