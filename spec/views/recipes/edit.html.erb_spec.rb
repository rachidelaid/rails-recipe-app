require 'rails_helper'

RSpec.describe 'recipes/edit', type: :system do
  before do
    driven_by(:rack_test)

    user = User.create!(name: 'rachid', email: 'rachid@example.com', password: 'f4k3p455w0rd',
                        password_confirmation: 'f4k3p455w0rd')
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)

    @recipe = Recipe.create(
      name: 'first recipe',
      preparation_time: 'Preparation Time',
      cooking_time: 'Cooking Time',
      decription: 'Decription',
      public: true,
      user_id: user.id
    )

    visit edit_recipe_path(@recipe.id)
  end

  it 'should show the page title' do
    expect(page).to have_content('Editing recipe')
  end

  it 'should show the preparation time input' do
    expect(page).to have_css('#recipe_preparation_time')
  end

  it 'should show the description input' do
    expect(page).to have_css('#recipe_decription')
  end

  it 'Should change the name' do
    within("form") do
      fill_in 'Name', with: 'name changed'
    end
    click_button 'Create'
    @recipe.reload
    expect(@recipe.name).to eql("name changed")
  end
end
