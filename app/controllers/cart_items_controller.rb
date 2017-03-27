class CartItemsController < ApplicationController

	def create
		dish = Dish.find(params[:dish_id])
		@cart = current_user.carts.where(place: dish.place).first
		if CartItem.where(dish: dish, cart: @cart).exists?
			@cart_item = CartItem.where(dish: dish, cart: @cart).first
			@cart_item.amount += 1
			@cart_item.save
			session[:answer] == 'Text'
		else
			@dish_cart = CartItem.create dish: dish, cart: @cart, price: dish.price, amount: 1
		end
		respond_to do |format|
			format.html { redirect_to :back }
			format.js {}
		end
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart = @cart_item.cart
		@cart_item.destroy

		respond_to do |format|
			format.html { redirect_to :back }
			format.js {}
		end
	end
end