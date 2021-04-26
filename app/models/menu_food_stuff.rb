class MenuFoodStuff
  include ActiveModel::Model
  attr_accessor :image, :menu_name, :recipe, :user_id, :food_stuff_name, :quantity, :menu_id

  with_options presence: true do
    validates :image
    validates :menu_name
    validates :recipe
    validates :user_id
    validates :food_stuff_name
    validates :quantity
  end

  def save
    
    menu = Menu.create(menu_name: menu_name, recipe: recipe, user_id: user_id, image: image)
    
    
    FoodStuff.create(food_stuff_name: food_stuff_name, quantity: quantity, menu_id: menu.id)
  end
end