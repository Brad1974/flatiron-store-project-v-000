class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :carts

  def current_cart=(cart)
    self.current_cart_id = cart.id if cart
    self.save
  end

  def current_cart
    Cart.find(current_cart_id) unless self.current_cart_id.nil?
  end
end
