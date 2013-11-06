class CreateMood < ActiveRecord::Migration
  def change
    create_table :moods do |t|
        t.datetime :date
      t.integer :vote_value
    end
  end
end
