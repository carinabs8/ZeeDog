class Api::V1::SearchesController < ApplicationController
	def index
		response = Api::V1::ApiGithubService.search(params_permit)
  	render json: response
	end

	private
	def params_permit
		params.permit([:q, :per_page, :page, :order, :sort, :search_id])
	end
end
