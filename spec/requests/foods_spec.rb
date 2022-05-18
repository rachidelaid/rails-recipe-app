require 'rails_helper'

RSpec.describe '/foods', type: :request do
  let(:test_user) { create :user }
  before { sign_in test_user }
  let(:valid_attributes) { { name: 'name', measurement_unit: 'grams', price: 27.99, user: test_user } }

  let(:invalid_attributes) { { name: 'name', price: 27.99, user: test_user } }

  describe 'GET /index' do
    it 'renders a successful response' do
      Food.create! valid_attributes
      get foods_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_food_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      food = Food.create! valid_attributes
      get edit_food_url(food)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Food' do
        expect do
          post foods_url, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the foods list page' do
        post foods_url, params: { food: valid_attributes }
        expect(response).to redirect_to(foods_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Food' do
        expect do
          post foods_url, params: { food: invalid_attributes }
        end.to change(Food, :count).by(0)
      end

      it 'has http status of an unprocessable_entity' do
        post foods_url, params: { food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'new_name', measurement_unit: 'grams', price: 27.99, user: test_user } }
      let(:invalid_attributes) { { price: 'cool' } }

      it 'updates the requested food' do
        food = Food.create! valid_attributes
        patch food_url(food), params: { food: new_attributes }
        food.reload
        expect(food.name).to eq(new_attributes[:name])
      end

      it 'redirects to the food' do
        food = Food.create! valid_attributes
        patch food_url(food), params: { food: new_attributes }
        food.reload
        expect(response).to redirect_to(foods_url)
      end
    end

    context 'with invalid parameters' do
      it 'has http status of an unprocessable_entity' do
        food = Food.create! valid_attributes
        patch food_url(food), params: { food: { price: 'price' } }
        expect(response).not_to redirect_to foods_url
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested food' do
      food = Food.create! valid_attributes
      expect do
        delete food_url(food)
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the foods list' do
      food = Food.create! valid_attributes
      delete food_url(food)
      expect(response).to redirect_to(foods_url)
    end
  end
end
