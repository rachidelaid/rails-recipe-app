require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    assign(:recipes, [
             Recipe.create!(
               name: 'Name',
               preparation_time: 'Preparation Time',
               cooking_time: 'Cooking Time',
               decription: 'Decription',
               public: false,
               user: nil
             ),
             Recipe.create!(
               name: 'Name',
               preparation_time: 'Preparation Time',
               cooking_time: 'Cooking Time',
               decription: 'Decription',
               public: false,
               user: nil
             )
           ])
  end

  it 'renders a list of recipes' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Preparation Time'.to_s, count: 2
    assert_select 'tr>td', text: 'Cooking Time'.to_s, count: 2
    assert_select 'tr>td', text: 'Decription'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
