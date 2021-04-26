class MenuFoodStuff
  include ActiveModel::Model
  attr_accessor :image,:menu_name, :recipe, :serving, :user_id, :food_stuff_name, :quantity, :menu_id

  with_options presence: true do
    validates :menu_name
    validates :recipe
    validates :serving
    validates :user_id
    validates :food_stuff_name
    validates :quantity
    validates :menu_id
  end
end