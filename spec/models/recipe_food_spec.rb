require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it { should belong_to :food }
  it { should belong_to :recipe }
  it { should validate_presence_of :quantity }
end
