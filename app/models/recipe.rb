class Recipe < ApplicationRecord
  belongs_to :user

  validates :preparation_time, presence: true
  validates :name, presence: true
  validates :cooking_time, presence: true
  validates :decription, presence: true
  validates :public, presence: true
end
