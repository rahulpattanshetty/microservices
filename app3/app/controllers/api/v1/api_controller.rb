class Api::V1::ApiController < ApplicationController

rescue_from ActiveRecord::RecordNotFound do 
	render 'error.json'
end

end