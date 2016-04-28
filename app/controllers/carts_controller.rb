class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    @cart.status = "submitted"
    @cart.save
    current_user.current_cart = nil
    binding.pry
    redirect_to cart_path(@cart)
  end

end
