class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods, through: :recipe_foods

  validates :preparation_time, presence: true
  validates :name, presence: true
  validates :cooking_time, presence: true
  validates :decription, presence: true
end
