class Api::V1::ApiGithubService
	class << self
		def public_repositories(params={})
			since = params[:since].blank? ? 1 : params[:since]
			connection.get("/repositories", params).body
		end

		def search(params={q: '', per_page: 10, page: 1, order: :desc, sort: :stars})
			connection.get("/search/repositories", params_search(params))&.body
		end

		def user_repositories(username="", params={})
			connection.get("/users/#{username}/repos", params_search(params))&.body
		end

		private
		def params_search(params)
			if params[:search_id].present?
				params[:q] = params[:q] + "+language:#{params[:search_id]}"
				params.delete(:search_id)
			end
			params
		end

		def connection
			Api::V1::ConnectionService.new
		end
	end
end