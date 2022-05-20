require 'rails_helper'

RSpec.describe 'recipes/index', type: :system do
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

    @food = Food.create(
      name: 'apple',
      measurement_unit: 'grams',
      price: 2.5,
      user_id: user.id
    )

    @ingredient = RecipeFood.create(
      quantity: 10,
      food_id: @food.id,
      recipe_id: @recipe.id
    )

    visit recipe_path(@recipe)
  end

  it 'should show the recipe name' do
    expect(page).to have_content('first recipe')
  end

  it 'should show the Add ingredient button' do
    expect(page).to have_content('Add ingredient')
  end

  it 'Should open the add ingredient modal on click' do
    click_button 'Add ingredient'
    expect(page).to have_css('#popupAdd')
  end

  it 'should show the ingredient details' do
    expect(page).to have_content('apple 10.0 grams 25.0')
  end

  it 'Should open the edit ingredient modal on modify click' do
    click_link 'Modify'
    expect(page).to have_css('#popupEdit')
  end

  it 'Should delete ingredient on delete click' do
    click_link 'Delete'
    expect(page).to have_content('no ingredients')
  end
end
