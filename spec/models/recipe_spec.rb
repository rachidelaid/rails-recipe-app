require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :decription }
  it { should validate_presence_of :preparation_time }
  it { should validate_presence_of :cooking_time }
end
