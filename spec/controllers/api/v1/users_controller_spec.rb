require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "public repositories on Github" do
  	it "Should return all 200"  do
  		github_response = [{}]
  		allow(controller).to receive(:params_permit).and_return({})
  		allow(Api::V1::ApiGithubService).to receive(:user_repositories).with("user_1", {}).and_return(github_response)
			get :repositories, params: {user_id: "user_1"}
  		expect(response).to have_http_status(200)
  	end
  end
end