class Api::V1::CategoriesController < ApplicationController




def index
	@categories = Category.all
	
end
def show
	@category = Category.find(params[:id])
	response = HTTParty.get("http://localhost:3002/api/v1/products/#{@category.id}")
	@products = JSON.parse(response.body)
	#binding.pry
end
end
