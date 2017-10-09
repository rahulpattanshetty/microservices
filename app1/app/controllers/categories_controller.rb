class CategoriesController < ApplicationController
  def index
  	response = HTTParty.get("http://localhost:3001/api/v1/categories.json")
  	@categories = JSON.parse(response.body)

  end

  def show
  	#binding.pry
  	response = HTTParty.get("http://localhost:3001/api/v1/categories/#{params["id"]}")
  	@category = JSON.parse(response.body)
  	response_product = HTTParty.get("http://localhost:3002/api/v1/products")
    @products = JSON.parse(response_product.body)
  end
end
