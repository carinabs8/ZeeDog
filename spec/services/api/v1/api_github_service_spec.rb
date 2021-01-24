require "rails_helper"

RSpec.describe Api::V1::ApiGithubService, :type => :model do
  context "class methods" do
	  let(:stubs)  { Faraday::Adapter::Test::Stubs.new }
	  let(:conn)   { Faraday.new { |b| b.adapter(:test, stubs) } }
		describe "public_repositories" do
			it "Should return all public repositories" do
				repositories = [
		    {
	        "id": 1,
	        "node_id": "MDEwOlJlcG9zaXRvcnkx",
	        "name": "grit",
	        "full_name": "mojombo/grit",
	        "private": false,
	        "owner": {
	          "login": "mojombo",
	          "id": 1,
	          "node_id": "MDQ6VXNlcjE=",
	          "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
	          "gravatar_id": "",
	          "url": "https://api.github.com/users/mojombo",
	          "html_url": "https://github.com/mojombo",
	          "followers_url": "https://api.github.com/users/mojombo/followers",
	          "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
	          "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
	          "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
	          "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
	          "organizations_url": "https://api.github.com/users/mojombo/orgs",
	          "repos_url": "https://api.github.com/users/mojombo/repos",
	          "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
	          "received_events_url": "https://api.github.com/users/mojombo/received_events",
	          "type": "User",
	          "site_admin": false
		        },
		        "html_url": "https://github.com/mojombo/grit",
		        "description": "**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.",
		        "fork": false,
		        "url": "https://api.github.com/repos/mojombo/grit",
		        "forks_url": "https://api.github.com/repos/mojombo/grit/forks",
		        "keys_url": "https://api.github.com/repos/mojombo/grit/keys{/key_id}",
		        "collaborators_url": "https://api.github.com/repos/mojombo/grit/collaborators{/collaborator}",
		        "teams_url": "https://api.github.com/repos/mojombo/grit/teams",
		        "hooks_url": "https://api.github.com/repos/mojombo/grit/hooks",
		        "issue_events_url": "https://api.github.com/repos/mojombo/grit/issues/events{/number}",
		        "events_url": "https://api.github.com/repos/mojombo/grit/events",
		        "assignees_url": "https://api.github.com/repos/mojombo/grit/assignees{/user}",
		        "branches_url": "https://api.github.com/repos/mojombo/grit/branches{/branch}",
		        "tags_url": "https://api.github.com/repos/mojombo/grit/tags",
		        "blobs_url": "https://api.github.com/repos/mojombo/grit/git/blobs{/sha}",
		        "git_tags_url": "https://api.github.com/repos/mojombo/grit/git/tags{/sha}",
		        "git_refs_url": "https://api.github.com/repos/mojombo/grit/git/refs{/sha}",
		        "trees_url": "https://api.github.com/repos/mojombo/grit/git/trees{/sha}",
		        "statuses_url": "https://api.github.com/repos/mojombo/grit/statuses/{sha}",
		        "languages_url": "https://api.github.com/repos/mojombo/grit/languages",
		        "stargazers_url": "https://api.github.com/repos/mojombo/grit/stargazers",
		        "contributors_url": "https://api.github.com/repos/mojombo/grit/contributors",
		        "subscribers_url": "https://api.github.com/repos/mojombo/grit/subscribers",
		        "subscription_url": "https://api.github.com/repos/mojombo/grit/subscription",
		        "commits_url": "https://api.github.com/repos/mojombo/grit/commits{/sha}",
		        "git_commits_url": "https://api.github.com/repos/mojombo/grit/git/commits{/sha}",
		        "comments_url": "https://api.github.com/repos/mojombo/grit/comments{/number}",
		        "issue_comment_url": "https://api.github.com/repos/mojombo/grit/issues/comments{/number}",
		        "contents_url": "https://api.github.com/repos/mojombo/grit/contents/{+path}",
		        "compare_url": "https://api.github.com/repos/mojombo/grit/compare/{base}...{head}",
		        "merges_url": "https://api.github.com/repos/mojombo/grit/merges",
		        "archive_url": "https://api.github.com/repos/mojombo/grit/{archive_format}{/ref}",
		        "downloads_url": "https://api.github.com/repos/mojombo/grit/downloads",
		        "issues_url": "https://api.github.com/repos/mojombo/grit/issues{/number}",
		        "pulls_url": "https://api.github.com/repos/mojombo/grit/pulls{/number}",
		        "milestones_url": "https://api.github.com/repos/mojombo/grit/milestones{/number}",
		        "notifications_url": "https://api.github.com/repos/mojombo/grit/notifications{?since,all,participating}",
		        "labels_url": "https://api.github.com/repos/mojombo/grit/labels{/name}",
		        "releases_url": "https://api.github.com/repos/mojombo/grit/releases{/id}",
		        "deployments_url": "https://api.github.com/repos/mojombo/grit/deployments"
		    }]
		    stubs.get('/repositories') do |env|
		      expect(env.url.path).to eq('/repositories')
		      [
		        200,
		        { 'Content-Type': 'application/javascript' },
		        repositories      
		      ]
		    end


		    allow_any_instance_of(Api::V1::ConnectionService).to receive(:conn).and_return(conn)
		    allow_any_instance_of(Api::V1::ConnectionService).to receive(:body).and_return(repositories)
				expect(Api::V1::ApiGithubService.public_repositories).to eq(repositories)
			end
		end
		describe "search" do
			it "Should search by any text" do
				repositories = {
			    "total_count": 539,
			    "incomplete_results": false,
			    "items": [
				    {
				      "id": 13968244,
				      "node_id": "MDEwOlJlcG9zaXRvcnkxMzk2ODI0NA==",
				      "name": "carina",
				      "full_name": "qaprosoft/carina",
				      "private": false,
				      "owner": {
			          "login": "qaprosoft",
			          "id": 2371175,
			          "node_id": "MDEyOk9yZ2FuaXphdGlvbjIzNzExNzU=",
			          "avatar_url": "https://avatars.githubusercontent.com/u/2371175?v=4",
			          "gravatar_id": "",
			          "url": "https://api.github.com/users/qaprosoft",
			          "html_url": "https://github.com/qaprosoft",
			          "followers_url": "https://api.github.com/users/qaprosoft/followers",
			          "following_url": "https://api.github.com/users/qaprosoft/following{/other_user}",
			          "gists_url": "https://api.github.com/users/qaprosoft/gists{/gist_id}",
			          "starred_url": "https://api.github.com/users/qaprosoft/starred{/owner}{/repo}",
			          "subscriptions_url": "https://api.github.com/users/qaprosoft/subscriptions",
			          "organizations_url": "https://api.github.com/users/qaprosoft/orgs",
			          "repos_url": "https://api.github.com/users/qaprosoft/repos",
			          "events_url": "https://api.github.com/users/qaprosoft/events{/privacy}",
			          "received_events_url": "https://api.github.com/users/qaprosoft/received_events",
			          "type": "Organization",
			          "site_admin": false
				      },
				      "html_url": "https://github.com/qaprosoft/carina",
				      "description": "Carina automation framework: Web, Mobile, API, DB",
				      "fork": false,
				      "url": "https://api.github.com/repos/qaprosoft/carina",
				      "forks_url": "https://api.github.com/repos/qaprosoft/carina/forks",
				      "keys_url": "https://api.github.com/repos/qaprosoft/carina/keys{/key_id}",
				      "collaborators_url": "https://api.github.com/repos/qaprosoft/carina/collaborators{/collaborator}",
				      "teams_url": "https://api.github.com/repos/qaprosoft/carina/teams",
				      "hooks_url": "https://api.github.com/repos/qaprosoft/carina/hooks",
				      "issue_events_url": "https://api.github.com/repos/qaprosoft/carina/issues/events{/number}",
				      "events_url": "https://api.github.com/repos/qaprosoft/carina/events",
				      "assignees_url": "https://api.github.com/repos/qaprosoft/carina/assignees{/user}",
				      "branches_url": "https://api.github.com/repos/qaprosoft/carina/branches{/branch}",
				      "tags_url": "https://api.github.com/repos/qaprosoft/carina/tags",
				      "blobs_url": "https://api.github.com/repos/qaprosoft/carina/git/blobs{/sha}",
				      "git_tags_url": "https://api.github.com/repos/qaprosoft/carina/git/tags{/sha}",
				      "git_refs_url": "https://api.github.com/repos/qaprosoft/carina/git/refs{/sha}",
				      "trees_url": "https://api.github.com/repos/qaprosoft/carina/git/trees{/sha}",
				      "statuses_url": "https://api.github.com/repos/qaprosoft/carina/statuses/{sha}",
				      "languages_url": "https://api.github.com/repos/qaprosoft/carina/languages",
				      "stargazers_url": "https://api.github.com/repos/qaprosoft/carina/stargazers",
				      "contributors_url": "https://api.github.com/repos/qaprosoft/carina/contributors",
				      "subscribers_url": "https://api.github.com/repos/qaprosoft/carina/subscribers",
				      "subscription_url": "https://api.github.com/repos/qaprosoft/carina/subscription",
				      "commits_url": "https://api.github.com/repos/qaprosoft/carina/commits{/sha}",
				      "git_commits_url": "https://api.github.com/repos/qaprosoft/carina/git/commits{/sha}",
				      "comments_url": "https://api.github.com/repos/qaprosoft/carina/comments{/number}",
				      "issue_comment_url": "https://api.github.com/repos/qaprosoft/carina/issues/comments{/number}",
				      "contents_url": "https://api.github.com/repos/qaprosoft/carina/contents/{+path}",
				      "compare_url": "https://api.github.com/repos/qaprosoft/carina/compare/{base}...{head}",
				      "merges_url": "https://api.github.com/repos/qaprosoft/carina/merges",
				      "archive_url": "https://api.github.com/repos/qaprosoft/carina/{archive_format}{/ref}",
				      "downloads_url": "https://api.github.com/repos/qaprosoft/carina/downloads",
				      "issues_url": "https://api.github.com/repos/qaprosoft/carina/issues{/number}",
				      "pulls_url": "https://api.github.com/repos/qaprosoft/carina/pulls{/number}",
				      "milestones_url": "https://api.github.com/repos/qaprosoft/carina/milestones{/number}",
				      "notifications_url": "https://api.github.com/repos/qaprosoft/carina/notifications{?since,all,participating}",
				      "labels_url": "https://api.github.com/repos/qaprosoft/carina/labels{/name}",
				      "releases_url": "https://api.github.com/repos/qaprosoft/carina/releases{/id}",
				      "deployments_url": "https://api.github.com/repos/qaprosoft/carina/deployments",
				      "created_at": "2013-10-29T20:46:25Z",
				      "updated_at": "2021-01-23T13:08:32Z",
				      "pushed_at": "2021-01-23T13:08:29Z",
				      "git_url": "git://github.com/qaprosoft/carina.git",
				      "ssh_url": "git@github.com:qaprosoft/carina.git",
				      "clone_url": "https://github.com/qaprosoft/carina.git",
				      "svn_url": "https://github.com/qaprosoft/carina",
				      "homepage": "http://qaprosoft.github.io/carina",
				      "size": 48444,
				      "stargazers_count": 543,
				      "watchers_count": 543,
				      "language": "Java",
				      "has_issues": true,
				      "has_projects": true,
				      "has_downloads": true,
				      "has_wiki": true,
				      "has_pages": true,
				      "forks_count": 144,
				      "mirror_url": nil,
				      "archived": false,
				      "disabled": false,
				      "open_issues_count": 59,
				      "license": {
			          "key": "apache-2.0",
			          "name": "Apache License 2.0",
			          "spdx_id": "Apache-2.0",
			          "url": "https://api.github.com/licenses/apache-2.0",
			          "node_id": "MDc6TGljZW5zZTI="
				      },
				      "forks": 144,
				      "open_issues": 59,
				      "watchers": 543,
				      "default_branch": "master",
				      "score": 1.0
					  }
					]
				}
				stubs.get('/search/repositories') do |env|
		      expect(env.url.path).to eq('/search/repositories')
		      [
		        200,
		        { 'Content-Type': 'application/javascript' },
		        [repositories]      
		      ]
		    end

		    allow_any_instance_of(Api::V1::ConnectionService).to receive(:conn).and_return(conn)
				expect(Api::V1::ApiGithubService.search).to eq([repositories])
			end

			it "Should receive params and url for search" do
				allow_any_instance_of(Api::V1::ConnectionService).to receive(:conn).and_return(conn)
				allow_any_instance_of(Api::V1::ConnectionService).to receive(:get).with("/search/repositories", {:q=>"test"})
				expect(Api::V1::ApiGithubService.search({q: "test"})).to eq(nil)
			end
		end

		describe "user_repositories" do
			it "Should list all repositories from 'Joana' user" do
				repositories = [
			    {
		        "id": 38845651,
		        "node_id": "MDEwOlJlcG9zaXRvcnkzODg0NTY1MQ==",
		        "name": "api_clients",
		        "full_name": "joana/api_clients",
		        "private": false,
		        "owner": {
	            "login": "joana",
	            "id": 125181,
	            "node_id": "MDQ6VXNlcjEyNTE4MQ==",
	            "avatar_url": "https://avatars.githubusercontent.com/u/125181?v=4",
	            "gravatar_id": "",
	            "type": "User",
	            "site_admin": false
		        },
		        "description": nil,
		        "fork": false,
		        "created_at": "2015-07-09T21:14:59Z",
		        "updated_at": "2015-07-09T21:14:59Z",
		        "pushed_at": "2015-10-25T22:33:47Z",
		        "homepage": nil,
		        "size": 184,
		        "stargazers_count": 0,
		        "watchers_count": 0,
		        "language": nil,
		        "has_issues": true,
		        "has_projects": true,
		        "has_downloads": true,
		        "has_wiki": true,
		        "has_pages": false,
		        "forks_count": 0,
		        "mirror_url": nil,
		        "archived": false,
		        "disabled": false,
		        "open_issues_count": 0,
		        "license": nil,
		        "forks": 0,
		        "open_issues": 0,
		        "watchers": 0,
		        "default_branch": "master"
			    }
				]
				stubs.get('/users/Joana/repos') do |env|
		      expect(env.url.path).to eq('/users/Joana/repos')
		      [
		        200,
		        { 'Content-Type': 'application/javascript' },
		        [repositories]      
		      ]
		    end
				allow_any_instance_of(Api::V1::ConnectionService).to receive(:conn).and_return(conn)
				expect(Api::V1::ApiGithubService.user_repositories("Joana")).to eq([repositories])
			end
		end
	end
end