class AddCountToMoods < ActiveRecord::Migration
  def change
    add_column :moods, :count, :integer
  end
end
