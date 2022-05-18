class RecipeFoodsController < ApplicationController
  def create
    @food = RecipeFood.new(
      quantity: params[:quantity]
    )
    @food.food_id = params["food_id"]
    @food.recipe_id = params["format"]
    if @food.save
      redirect_to recipe_path(params["format"])
      flash[:notice] = 'ingredient added successfully'
    else
      redirect_to recipe_path(params["format"])
      flash[:alert] = 'something happened while adding the ingredient'
    end
  end
  
  def edit; end
  
  def delete
    p params
    p "delete"
    # @food = RecipeFood.find_by(id: params[:id])
    
    # if @food.destroy
    #   redirect_to recipe_path(params["format"]), status: 303
    #   flash[:notice] = 'ingredient deleted successfully'
    # else
    #   render :new
    # end
  end
end