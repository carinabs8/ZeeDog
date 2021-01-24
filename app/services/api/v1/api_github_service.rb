class Api::V1::ApiGithubService
	class << self
		def public_repositories(params={})
			since = params[:since].blank? ? 1 : params[:since]
			response = Faraday.get("https://api.github.com/repositories",{since: since}, {'Accept' => 'application/vnd.github.v3+json')
			JSON.parse(response.body)
		end
	end
end