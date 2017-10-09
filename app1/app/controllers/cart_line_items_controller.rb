class CartLineItemsController < ApplicationController
  def index
  	response = HTTParty.get("http://localhost:3003/api/v1/line_items/#{current_user.id}")
  	@cart_line_items = JSON.parse(response.body)
  end
  def destroy
  	@line_id=params[:id]
  	HTTParty.get("http://localhost:3003/api/v1/line_items?line_id=#{@line_id}")
  	redirect_to "http://localhost:3000/cart_line_items"
  	
  end
end
