class ShoppingListController < ApplicationController
  before_action :authenticate_user!
  def index
    @amount = 3
    @value = 1000
    @items = [
      {price:40,name:'apples',quantity:5},
      {price:40,name:'apples',quantity:5},
      {price:40,name:'apples',quantity:5},
      {price:40,name:'apples',quantity:5}
    ]
  end
end
