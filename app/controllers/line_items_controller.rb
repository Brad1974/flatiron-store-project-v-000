class LineItemsController < ApplicationController
  def create

      if current_user.current_cart.nil?
        @cart = Cart.create(user: current_user)
        current_user.current_cart = @cart
      else
        @cart = current_user.current_cart
      end
      @line_item = @cart.add_item(params[:item_id])
      if @line_item.save && @cart.save
        redirect_to cart_path(@cart), notice: "Item added."
      else
        redirect_to store_path, alert: "Error adding item to cart"
      end
    end

  end
