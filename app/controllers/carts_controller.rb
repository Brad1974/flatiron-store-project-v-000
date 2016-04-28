class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    #binding.pry
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    @cart.status = "submitted"
    current_user.current_cart.save
    current_user.current_cart = nil
    redirect_to cart_path(@cart), notice: "Order placed."
  end

end
