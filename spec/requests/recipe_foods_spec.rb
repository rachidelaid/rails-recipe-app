require 'rails_helper'

RSpec.describe '/recipe_foods', type: :request do
  let(:test_user) { create :user }
  let(:test_recipe) { create :recipe, user: test_user }
  let(:test_food) { create :food, user: test_user }
  before { sign_in test_user }

  # let(:valid_attributes) { build(:recipe_food, recipe: test_recipe, food: test_food).attributes }
  # let(:invalid_attributes) { build(:recipe_food, quantity: nil).attributes }

  let(:valid_attributes) { { quantity: 10, food_id: test_food.id, recipe_id: test_recipe.id } }
  let(:invalid_attributes) { { quantity: nil, food_id: test_food.id, recipe_id: test_recipe.id } }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new ingredient' do
        expect do
          post recipe_foods_url, params: valid_attributes
        end.to change(RecipeFood, :count).by(1)
      end

      it 'redirects to the recipe' do
        post recipe_foods_url, params: valid_attributes
        expect(response).to redirect_to(recipe_url(Recipe.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ingredient' do
        expect do
          post recipe_foods_url, params: invalid_attributes
        end.to change(RecipeFood, :count).by(0)
      end

      it 'renders a successful response' do
        post recipe_foods_url, params: invalid_attributes
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { quantity: 7, food_id: test_food.id, recipe_id: test_recipe.id } }

      it 'updates the requested ingredient' do
        ingredient = RecipeFood.create! valid_attributes
        patch recipe_food_url(ingredient.id), params: { recipe_food: new_attributes, recipe_id: test_food.id }
        ingredient.reload
        expect(ingredient.quantity).to eq(7)
      end

      it 'redirects to the recipe' do
        ingredient = RecipeFood.create! valid_attributes
        patch recipe_food_url(ingredient.id), params: { recipe_food: new_attributes, recipe_id: test_recipe.id }
        ingredient.reload
        expect(response).to redirect_to(recipe_url(test_recipe.id))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response' do
        ingredient = RecipeFood.create! valid_attributes
        patch recipe_food_url(ingredient.id), params: { recipe_food: invalid_attributes, recipe_id: test_recipe.id }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe' do
      ingredient = RecipeFood.create! valid_attributes
      expect do
        delete recipe_food_url({ id: ingredient.id, recipe_id: test_recipe.id })
      end.to change(RecipeFood, :count).by(-1)
    end

    it 'redirects to the recipes list' do
      ingredient = RecipeFood.create! valid_attributes
      delete recipe_food_url({ id: ingredient.id, recipe_id: test_recipe.id })
      expect(response).to redirect_to(recipe_url(test_recipe.id))
    end
  end
end
