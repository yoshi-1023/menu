class CreateFoodStuffMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :food_stuff_menus do |t|
      t.references :food_stuff,     null: false, foreign_key: true
      t.references :menu,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
