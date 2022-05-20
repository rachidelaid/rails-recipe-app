require 'rails_helper'

RSpec.describe Food, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :measurement_unit }
  it { should validate_presence_of :price }
end
