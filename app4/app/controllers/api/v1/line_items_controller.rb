class Api::V1::LineItemsController < ApplicationController
	skip_before_action :verify_authenticity_token
def index
	#binding.pry
	if params[:line_id]
		@line_item = LineItem.find(params[:line_id])
		@line_item.destroy
	end
	#redirect_to "http://localhost:3000/cart_line_items"
end

def create
	#binding.pry
	@line_item = LineItem.new
	@line_item.user_id =params[:user_id]
	@line_item.product_id =params[:product_id]
	@line_item.quantity =params[:quantity]
	@line_item.save
	redirect_to 'http://localhost:3000/categories', notice:"Added to cart successfully"
end
def show
	
	@line_items = LineItem.where('user_id = ?',params[:id])
end
def destroy
	binding.pry
	@line_items = LineItem.where('user_id = ?',params[:id])
	binding.pry
	@line_items.delete_all
	redirect_to 'http://localhost:3000', notice:"deleted"
end
end
