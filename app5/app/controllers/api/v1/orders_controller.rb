class Api::V1::OrdersController < Api::V1::ApiController

def create
	@order = Order.new(order_date:Date.today, order_no:"#{Random.rand(1000)}")
	@order.total = params[:total]
	@order.user_id = params[:user_id]
	@order.save
	redirect_to 'http://localhost:3000/categories', notice:"Added to cart successfully"
end
def show
	#binding.pry
	@orders = Order.where('user_id = ?',params[:id])
end

end
