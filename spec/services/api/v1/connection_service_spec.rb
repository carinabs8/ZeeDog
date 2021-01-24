require "rails_helper"

RSpec.describe Api::V1::ApiGithubService, :type => :model do
  context "class methods" do
  	let(:stubs)  { Faraday::Adapter::Test::Stubs.new }
	  let(:conn)   { Faraday.new { |b| b.adapter(:test, stubs) } }

	  it "Should return body of response of /search/repositories" do
	  	stubs.get('/search/repositories') do |env|
	      expect(env.url.path).to eq('/search/repositories')
	      [
	        200,
	        { 'Content-Type': 'application/javascript' },
	        "body"      
	      ]
	    end
	    allow_any_instance_of(Api::V1::ConnectionService).to receive(:conn).and_return(conn)
	  	connection = Api::V1::ConnectionService.new
	  	expect(connection.get("/search/repositories").body).to eq("body")
	  end

	  it "Should return body of response of /repositories" do
	  	stubs.get('/repositories') do |env|
	      expect(env.url.path).to eq('/repositories')
	      [
	        200,
	        { 'Content-Type': 'application/javascript' },
	        "body"      
	      ]
	    end
	    allow_any_instance_of(Api::V1::ConnectionService).to receive(:conn).and_return(conn)
	  	connection = Api::V1::ConnectionService.new
	  	expect(connection.get("/repositories").body).to eq("body")
	  end

	  it "Should return body of response of user /repositories" do
	  	stubs.get('/users/Joana/repos') do |env|
	      expect(env.url.path).to eq('/users/Joana/repos')
	      [
	        200,
	        { 'Content-Type': 'application/javascript' },
	        "body"      
	      ]
	    end
	    allow_any_instance_of(Api::V1::ConnectionService).to receive(:conn).and_return(conn)
	  	connection = Api::V1::ConnectionService.new
	  	expect(connection.get("/users/Joana/repos").body).to eq("body")
	  end
	end
end