class SitesController < ApplicationController
  def index
  	response = HTTParty.get("http://localhost:3001/api/v1/categories.json")
  	@categories = JSON.parse(response.body)

  	response = HTTParty.get("http://localhost:3002/api/v1/products")

  	@products = JSON.parse(response.body)
  end

  def show
  	response_category = HTTParty.get("http://localhost:3001/api/v1/categories/#{params["id"]}")
  	@category = JSON.parse(response_category.body)
    response_product = HTTParty.get("http://localhost:3002/api/v1/products")
    @products = JSON.parse(response_product.body)
  end
  
  def show_product
    binding.pry
    response = HTTParty.get("http://localhost:3002/api/v1/products/#{params["id"]}")
    @product = JSON.parse(response.body)

  end
end
