class FoodChange < ActiveRecord::Migration
  def change
	change_table :foods do |t|
		t.integer :grid_position
	end
  end
end
