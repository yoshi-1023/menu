class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @food_stuffs = FoodStuff.all
  end

  def new
    @menu_food_stuff = MenuFoodStuff.new
  end

  def create
    @menu_food_stuff = MenuFoodStuff.new(menu_params)
    if @menu_food_stuff.valid?
      @menu_food_stuff.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu_food_stuff).permit(:menu_name, :recipe, :food_stuff_name, :quantity,:image).merge(user_id: current_user.id)
  end

end
