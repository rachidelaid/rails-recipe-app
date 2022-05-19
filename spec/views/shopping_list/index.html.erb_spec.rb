require 'rails_helper'

RSpec.describe 'shopping_list/index', type: :system do
  let(:test_user) { create :user }

  before do
    sign_in test_user
    recipe = create :recipe
    visit shopping_list_path recipe
  end

  it 'should have the shopping list title' do
    expect(page).to have_content('The shopping list')
  end

  
end
