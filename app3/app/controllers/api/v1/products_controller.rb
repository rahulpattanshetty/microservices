class Api::V1::ProductsController < Api::V1::ApiController


def index
	@products = Product.all
	
end
def show
	#binding.pry
  @product = Product.find(params[:id])

end
end
