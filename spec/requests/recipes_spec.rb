require 'rails_helper'

RSpec.describe '/recipes', type: :request do
  let(:test_user) { create :user }
  before { sign_in test_user }

  let(:valid_attributes) { build(:recipe, user: test_user).attributes }
  let(:invalid_attributes) { build(:recipe, preparation_time: nil).attributes }

  describe 'GET /public' do
    before(:each) do
      get public_recipes_url
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response.body).to include('Public recipe page')
    end
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get recipes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      recipe = create :recipe
      get recipe_url(recipe)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_recipe_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      recipe = create :recipe
      get edit_recipe_url(recipe)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Recipe' do
        expect do
          post recipes_url, params: { recipe: valid_attributes }
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        post recipes_url, params: { recipe: valid_attributes }
        expect(response).to redirect_to(recipe_url(Recipe.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Recipe' do
        expect do
          post recipes_url, params: { recipe: invalid_attributes }
        end.to change(Recipe, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post recipes_url, params: { recipe: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { build(:recipe, preparation_time: '2 hours').attributes }

      it 'updates the requested recipe' do
        recipe = Recipe.create! valid_attributes
        patch recipe_url(recipe), params: { recipe: new_attributes }
        recipe.reload
        expect(recipe.preparation_time).to eq('2 hours')
      end

      it 'redirects to the recipe' do
        recipe = Recipe.create! valid_attributes
        patch recipe_url(recipe), params: { recipe: new_attributes }
        recipe.reload
        expect(response).to redirect_to(recipe_url(recipe))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        recipe = Recipe.create! valid_attributes
        patch recipe_url(recipe), params: { recipe: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe' do
      recipe = Recipe.create! valid_attributes
      expect do
        delete recipe_url(recipe)
      end.to change(Recipe, :count).by(-1)
    end

    it 'redirects to the recipes list' do
      recipe = Recipe.create! valid_attributes
      delete recipe_url(recipe)
      expect(response).to redirect_to(recipes_url)
    end
  end
end
