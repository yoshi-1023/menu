class CreateFoodStuffs < ActiveRecord::Migration[6.0]
  def change
    create_table :food_stuffs do |t|
      t.string :food_stuff_name, null: false
      t.string :quantity,        null: false
      t.references :menu,        foreign_key:true
      t.timestamps
    end
  end
end
