class CartsController < ApplicationController

 def index
   @products = current_cart.products
   @cart_items = current_cart.cart_items
 end


 def clean
   current_cart.clean!
   flash[:alert]="You have deleted cart"
   redirect_to :back
 end

 def checkout
  @order = Order.new
 end

end
