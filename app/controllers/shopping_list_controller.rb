class ShoppingListController < ApplicationController
  before_action :authenticate_user!
  def index
    available_food = Food.where(user: current_user).map(&:name)
    total_recipe_food = RecipeFood.includes(:food).where(recipe_id: params[:recipe_id])
    missing_recipe_food = total_recipe_food.where.not(food: { name: available_food })
    @amount = missing_recipe_food.count
    @value = 0
    @items = []
    missing_recipe_food.each do |recipe_food|
      item_price = recipe_food.food.price * recipe_food.quantity
      @items << { price: item_price, quantity: recipe_food.quantity, name: recipe_food.food.name }
      @value += item_price
    end
  end
end
