require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(password: "password", email: "none@gmail.com")
  end

  it "has many carts" do
    @user.carts.create
    expect(@user.carts.count).to eq(1)
  end

  it "has a current_cart" do
    @user.current_cart = @user.carts.create
    expect(@user.current_cart).to be_a(Cart)
  end



end
