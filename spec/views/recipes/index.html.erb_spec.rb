require 'rails_helper'

RSpec.describe 'recipes/index', type: :system do
  before do
    driven_by(:rack_test)

    user = User.create!(name: 'rachid', email: 'rachid@example.com', password: 'f4k3p455w0rd',
                        password_confirmation: 'f4k3p455w0rd')
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)

    @recipe = Recipe.create!(
      name: 'first recipe',
      preparation_time: 'Preparation Time',
      cooking_time: 'Cooking Time',
      decription: 'Decription',
      public: false,
      user_id: user.id
    )
    Recipe.create!(
      name: 'second recipe',
      preparation_time: 'Preparation Time',
      cooking_time: 'Cooking Time',
      decription: 'Decription',
      public: false,
      user_id: user.id
    )

    visit recipes_path
  end

  it 'should list 2 recipes' do
    expect(page).to have_content('first recipe')
    expect(page).to have_content('second recipe')
  end

  it 'should show add new recipe link' do
    expect(page).to have_content('New recipe')
  end

  it 'Should lead to recipe details.' do
    click_link('first recipe')
    expect(current_path).to eql(recipe_path(@recipe.id))
  end
end
