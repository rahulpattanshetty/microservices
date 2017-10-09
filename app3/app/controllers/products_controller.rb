class ProductsController < ApplicationController
   def index
	@products = Product.all
	
end
def new
	@product = Product.new
	response = HTTParty.get("http://localhost:3001/api/v1/categories.json")
  	@result = JSON.parse(response.body)

  	@categories = {}
  	@cat = OpenStruct.new()
  	
  	

  	@result.each do |category|
  		@categories[category["id"]] = category["name"]
  		@cat[:id] = category["id"]
  		@cat[:name]= category["name"]
  	end
  	
end
def create
	@product = Product.new(params[:product].permit(:name,:price,:category_id))
	if @product.save
		redirect_to products_path, notice:"Successfully created"
	else
		redirect_to products_path, notice:"not created"	
	end
end
def show
  @product = Product.find(params[:id])
end
end
