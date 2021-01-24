require "test_helper"

class Api::V1::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_repositories_index_url
    assert_response :success
  end
end
