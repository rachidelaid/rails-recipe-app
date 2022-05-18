class Recipe < ApplicationRecord
  belongs_to :user

  validates :preparation_time, presence: true
end
