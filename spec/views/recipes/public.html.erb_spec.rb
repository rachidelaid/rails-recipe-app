require 'rails_helper'

RSpec.describe 'recipes/index', type: :system do
  before do
    driven_by(:rack_test)

    user = User.create!(name: 'rachid', email: 'rachid@example.com', password: 'f4k3p455w0rd',
                        password_confirmation: 'f4k3p455w0rd')
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    p user

    @recipe = Recipe.create(
      name: 'first recipe',
      preparation_time: 'Preparation Time',
      cooking_time: 'Cooking Time',
      decription: 'Decription',
      public: true,
      user_id: user.id
    )
    Recipe.create(
      name: 'second recipe',
      preparation_time: 'Preparation Time',
      cooking_time: 'Cooking Time',
      decription: 'Decription',
      public: false,
      user_id: user.id
    )

    visit root_path
  end

  it 'should only show the public recipe' do
    expect(page).to have_content('first recipe')
  end

  it 'Should lead to recipe details.' do
    click_link('first recipe')
    expect(current_path).to eql(recipe_path(@recipe.id))
  end
end
