class RemoveMood < ActiveRecord::Migration
  def change
    drop_table :moods
  end
end
