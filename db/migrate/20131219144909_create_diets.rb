class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
