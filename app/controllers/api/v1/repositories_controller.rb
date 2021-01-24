class Api::V1::RepositoriesController < ApplicationController
  def index
  	response = Api::V1::ApiGithubService.public_repositories({since: 1})
  	render json: response
  end
end
