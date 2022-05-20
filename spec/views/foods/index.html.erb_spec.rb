require 'rails_helper'

RSpec.describe 'foods/index', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user
    visit foods_url
  end

  it 'renders the Foods title' do
    expect(page).to have_content('Foods')
  end
  it 'renders a link to a new foods page' do
    expect(page).to have_link('New food')
  end
  it 'Should lead to recipe details.' do
    click_link('New food')
    expect(current_path).to eql(new_food_path)
  end
end
