class StoreController < ApplicationController

  def index
    @items = Item.available_items
    @categories = Category.all
  end

end
