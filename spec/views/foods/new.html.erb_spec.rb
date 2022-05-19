require 'rails_helper'

RSpec.describe 'foods/new', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user
    visit new_food_url
  end

  it 'renders the New food title' do
    expect(page).to have_content('New food')
  end
  it 'renders a link back to foods page' do
    expect(page).to have_link('Back to foods')
  end
  it 'Should lead bach to foods page' do
    click_link('Back to foods')
    expect(current_path).to eql(foods_path)
  end

end
