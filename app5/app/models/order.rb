class Order < ActiveRecord::Base
after_create :copy_items_to_order_line_items
after_create :empty_cart_line_item

def copy_items_to_order_line_items
	
	response = HTTParty.get("http://localhost:3003/api/v1/line_items/#{self.user_id}")
  	cart_line_items = JSON.parse(response.body)	
  	cart_line_items.each do |item|
  		line_item = OrderLineItem.new
		line_item.order_id = self.id
  		line_item.product_id = item["product_id"]
  		line_item.quantity = item["quantity"]
  		line_item.save
  	end
end
def empty_cart_line_item
  HTTParty.delete("http://localhost:3003/api/v1/line_items/#{self.user_id}")
end
end
