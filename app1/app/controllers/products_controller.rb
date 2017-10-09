class ProductsController < ApplicationController
  def index
  	response = HTTParty.get("http://localhost:3002/api/v1/products")
    @products = JSON.parse(response.body)
  end

  def show
  	response = HTTParty.get("http://localhost:3002/api/v1/products/#{params["id"]}")
    @product = JSON.parse(response.body)
  end
end
