class Api::V1::UsersController < ApplicationController
  def repositories
  	response = Api::V1::ApiGithubService.user_repositories(params[:user_id], params_permit)
  	render json: response
  end

  private
	def params_permit
		params.permit([:per_page, :page, :direction, :sort])
	end
end
