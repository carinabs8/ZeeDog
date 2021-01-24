require "rails_helper"

RSpec.describe Api::V1::SearchesController, type: :controller do
  describe "public repositories on Github" do
  	it "Should return all 200"  do
  		github_response = [{}]
  		allow(Api::V1::ApiGithubService).to receive(:search).and_return(github_response)
			get :index
  		expect(response).to have_http_status(200)
  	end
  end
end