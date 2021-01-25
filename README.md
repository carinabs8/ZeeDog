To start application you just need install some dependencies
	- ruby 3.0.0
	- bundle install
Aftter that run bundle exec rails s

this application just provide an api on Http rest.
	- /repositories
	- /searches
	- /users/:user_id/repositories

	the first request show all public repositories on git api, with parameter 'since' you can check all public repositories with id greater than this ID.
		/repositores?since=2
	the second one you have to search by respositories either order, sort and paginate results results
		/searches?q=somesearch
		/searches?q=somesearch&order=asc&sort=forks&per_page=1&page=1
			order can be 
					- asc
					- desc
			sort can be
					- stars
					- forks
					- help-wanted-issues
					- updated
			per_page is about how many results will come from this request
			page is which page number of results will be fetch
			To find some repository by language you just need to pass search_id as parameter 
				/searches?q=somesearch&order=asc&sort=forks&per_page=1&page=1&search_id=ruby
	third Url is:
		/users/:username/repositories
		In this url you will able to see all repositories thats belongs to some user. To apply order and sorts either paginations you have to follow some url parameteres
		/users/:username/repositories?per_page=4&page=1&direction=asc&sort=updated
			direction can be 
					- asc
					- desc
			sort can be
					- stars
					- forks
					- help-wanted-issues
					- updated