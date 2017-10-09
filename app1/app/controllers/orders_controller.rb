class OrdersController < ApplicationController
  def index
  	response = HTTParty.get("http://localhost:3004/api/v1/orders/#{current_user.id}")
  	@orders = JSON.parse(response.body)
  end
end
