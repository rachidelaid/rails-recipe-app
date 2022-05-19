class RecipeFoodsController < ApplicationController
  def create
    ingredient = RecipeFood.new(
      quantity: params[:quantity]
    )
    ingredient.food_id = params[:food_id]
    ingredient.recipe_id = params[:recipe_id]
    ingredient.save

    redirect_to recipe_path(params[:recipe_id])
    flash[:notice] = 'ingredient added successfully'
  end

  def update
    ingredient = RecipeFood.find(params[:id])
    quantity = params['recipe_food'][:quantity].to_f
    ingredient.update(quantity:)
    redirect_to recipe_path(params[:recipe_id]), status: 303
    flash[:notice] = 'ingredient updated successfully'
  end

  def destroy
    ingredient = RecipeFood.find_by(id: params[:id])
    ingredient.destroy

    redirect_to recipe_path(params[:recipe_id]), status: 303
    flash[:notice] = 'ingredient deleted successfully'
  end
end
