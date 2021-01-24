class Api::V1::ConnectionService
	attr_reader :conn, :response

	def initialize(url="https://api.github.com")
		@conn = Faraday.new(
			  url: url,
			  headers: {'Accept' => 'application/vnd.github.v3+json'}
			)
	end

	def body
		JSON.parse(response.body)
	end

	def get(path, params={})
		params = request_params(path, params)
		@response = conn.get(path) do | request |
			params.each do |params_key, params_value|
				request.params[params_key] = params_value
			end
		end
	end

	private
	def request_params(path, params={})
		method_path = path.split("/").reject{|x| x.blank?}.join("_").to_sym
		if  method_path == :search_repositories
			return params_search_repositories(params)
		elsif !method_path[/^users_.{1,}_repos/].blank?
			return params_search_by_user_repositories(params) 
		else
			params_default(params)
		end
	end

	def params_search_repositories(params={})
		params ||= {}
		params[:per_page] = per_page(params)
		params[:page] = page(params)
		params[:order] = order(params)
		params[:sort] = sort(params)
		params
	end

	def params_search_by_user_repositories(params={})
		params ||= {}
		params[:per_page] = per_page(params)
		params[:page] = page(params)
		params[:direction] = direction(params)
		params[:sort] = sort(params)
		params
	end

	def params_default(params)
		params
	end

	def per_page(params)
		return params[:per_page] if !params.blank? && params[:per_page].present?
		2
	end

	def page(params)
		return params[:page] if !params.blank? && params[:page].present?
		1
	end

	def order(params)
		return params[:order] if !params.blank? && params[:order].present?
		:desc
	end

	def direction(params)
		return params[:desc] if !params.blank? && params[:desc].present?
		:desc
	end

	def sort(params)
		return params[:sort] if !params.blank? && params[:sort].present?
		:stars
	end
end