require 'rails_helper'

RSpec.describe 'shopping_list/index', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user
    recipe = create :recipe
    visit shopping_list_path recipe
  end

  it 'should have the shopping list title' do
    expect(page).to have_content('The shopping list')
  end
  it 'should have the amount of food items to buy' do
    expect(page).to have_content('Amount of food items to buy')
  end
  it 'should have the total value of food items needed' do
    expect(page).to have_content('Total value of food items needed')
  end

  
end
