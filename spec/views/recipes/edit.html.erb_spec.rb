require 'rails_helper'

RSpec.describe 'recipes/edit', type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
                                name: 'MyString',
                                preparation_time: 'MyString',
                                cooking_time: 'MyString',
                                decription: 'MyString',
                                public: false,
                                user: nil
                              ))
  end

  it 'renders the edit recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipe_path(@recipe), 'post' do
      assert_select 'input[name=?]', 'recipe[name]'

      assert_select 'input[name=?]', 'recipe[preparation_time]'

      assert_select 'input[name=?]', 'recipe[cooking_time]'

      assert_select 'input[name=?]', 'recipe[decription]'

      assert_select 'input[name=?]', 'recipe[public]'

      assert_select 'input[name=?]', 'recipe[user_id]'
    end
  end
end
