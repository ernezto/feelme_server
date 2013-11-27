class CreateMoodsTable < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :name
      t.string :icon_path
    end
  end
end
