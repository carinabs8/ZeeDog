class Api::V1::RepositoriesController < ApplicationController
  def index
  	response = Api::V1::ApiGithubService.public_repositories(params_permit)
  	render json: response
  end

  private
	def params_permit
		params.permit([:since])
	end
end
