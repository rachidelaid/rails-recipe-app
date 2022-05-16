require 'rails_helper'

RSpec.describe "recipes/show", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      name: "Name",
      preparation_time: "Preparation Time",
      cooking_time: "Cooking Time",
      decription: "Decription",
      public: false,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Preparation Time/)
    expect(rendered).to match(/Cooking Time/)
    expect(rendered).to match(/Decription/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
