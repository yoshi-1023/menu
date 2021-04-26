class MenusController < ApplicationController
  def index
  end

  def new
    @menu_food_stuff = MenuFoodStuff.new
  end

  def create
  end
end
