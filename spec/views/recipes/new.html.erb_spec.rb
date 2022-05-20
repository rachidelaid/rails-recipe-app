require 'rails_helper'

RSpec.describe 'recipes/new', type: :system do
  before do
    driven_by(:rack_test)

    user = User.create!(name: 'rachid', email: 'rachid@example.com', password: 'f4k3p455w0rd',
                        password_confirmation: 'f4k3p455w0rd')
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)

    visit new_recipe_path
  end

  it 'should show the page title' do
    expect(page).to have_content('New recipe')
  end

  it 'should show the preparation time input' do
    expect(page).to have_css('#recipe_preparation_time')
  end

  it 'should show the description input' do
    expect(page).to have_css('#recipe_decription')
  end
end
