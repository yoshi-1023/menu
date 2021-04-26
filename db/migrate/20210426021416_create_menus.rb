class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :menu_name,  null: false
      t.text :recipe,       null: false
      t.references :user,   foreign_key: true
      t.timestamps
    end
  end
end
