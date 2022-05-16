require 'rails_helper'

RSpec.describe "foods/new", type: :view do
  before(:each) do
    assign(:food, Food.new(
      name: "MyString",
      measurement_unit: "MyString",
      price: 1.5,
      user: nil
    ))
  end

  it "renders new food form" do
    render

    assert_select "form[action=?][method=?]", foods_path, "post" do

      assert_select "input[name=?]", "food[name]"

      assert_select "input[name=?]", "food[measurement_unit]"

      assert_select "input[name=?]", "food[price]"

      assert_select "input[name=?]", "food[user_id]"
    end
  end
end
