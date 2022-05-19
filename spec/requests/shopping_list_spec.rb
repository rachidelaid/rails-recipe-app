require 'rails_helper'

RSpec.describe '/general_shopping_list/:recipe_id', type: :request do
  let(:test_user) { create :user }
  before { sign_in test_user }
  
  describe 'GET /index' do
    it 'renders a successful response' do    
      test_recipe = create :recipe, user: test_user      
      get shopping_list_url(recipe_id:test_recipe.id)
      expect(response).to be_successful
    end
  end
end