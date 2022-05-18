class ShoppingListController < ApplicationController
  before_action :authenticate_user!
  def index
    available_food = Food.where(user: current_user)
    total_recipe_food = RecipeFood.includes(food: :user).where(food: {user: current_user})
    #author_of_the_recipe
    missing_foods = total_recipe_food.where.not(food: available_food)
    @amount = missing_food.count
    @value = 1000
    @items = [
      {price:40,name:'apples',quantity:5},
      {price:40,name:'apples',quantity:5},
      {price:40,name:'apples',quantity:5},
      {price:40,name:'apples',quantity:5}
    ]
  end
end
