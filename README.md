
## To get it running

While in the project directory, in the command line run:
```ruby
bundle install
```

```ruby
rake db:create db:migrate
```

and
```ruby
rake db:seed
```

This will seed our database with all the products off of wine.com's API. This will take a very long time(40-50 minutes). For ease of set up, I left my own API key for use during the database seeding. If there are no more remaining queries, you can use figaro to set up an environment variable and use your API key after signing up for an account and replacing the key inside db/seeds.rb.

After completion, in the command line:
```ruby
rails s
```
to start the server. Visit http://localhost:3000 (3000 by default)in a browser. You should land on the index page populated by all the products in the database. Links to edit any of the products have been provided as well as a link to submit a new product.

To run the RSpec tests for the API calls, from the command line:
```ruby
be rspec spec
```
The code for the call requests tests are located in spec/controllers/products_controller_spec.rb

For API calls to this database, you can use the urls:

http://localhost:3000/products.json

to make a get request for the entire list of products that persist in the database in json formatting.

http://localhost:300/products/#{product id}.json

for get requests or patch requests with the appropriate attributes in json form to receive or edit individual products through an api call.

###Other gems used:

- addressable: To simplify the querybuilding for the api requests.
- rest-client: To make the API calls to the database.
- Factory Girl: Create mock models for RSpec testing.
- Faker: Create test data for mock models during RSpec testing.

###Future improvements
-Instantiate object models for nested attributes inside Product models from the wine.com API to get more comprehensive data. e.g. Appellations, Varietals, Community etc.
-Validations for models and attributes.
-Improve the database seeding to reduce query count and improve speed.

========

## Challenge for Rails Engineer
To better assess a candidates development skills, we provide this following challenge.  You have as much time as you'd like (though we ask that you not spend more than a few hours).

### Submission Instructions
1. First, fork this project on github.  You will need to create an account if you don't already have one.
1. Next, complete the project as described below within your fork.
1. Finally, push all of your changes to your fork on github and submit a pull request.  You should also email the appropriate address at Salido and your recruiter to let them know you have submitted a solution.  Make sure to include your github username in your email (so we can match people with pull requests).
1. Include in your README any assumptions or other information you want to communicate.
1. Include documentation of how to work with API calls.

### Alternate Submission Instructions (if you don't want to publicize completing the challenge)
1. Clone the repository
1. Next, complete your project as described below within your local repository
1. Email a patch file to the appropriate address at Salido and your recruiter to let them know you have submitted a solution.

### Project Description
Imagine that Salido has just acquired a new company called ABC Wine Distributors (ABC WD) for the purpose of selling wines through Salido's existing customer-facing mobile app.

Your job is to prorotype a web-based Inventory Management System.

ABC WD's API: https://api.wine.com You will need to sign up for an account to obtain your own apikey.

Here's what your application must do:

1. load ABC products from ABC WD's API into Salido's DB
1. allow an user to add new products to Salido's DB
1. allow an user to update existing products in Salido'S DB
1. expose a list of products in Salido'S DB using an API
1. allow a user to update existing products in Salido'S DB using an API
1. demonstrate your API calls using RSpec tests

Your application does not need to:

1. handle authentication or authorization
1. be aesthetically pleasing

Your application should be easy to set up and run on Rails 4 or later.  It should not require any for-pay software.

### Evaluation
Evaluation of your submission will be based on the following criteria.

1. Did your application fulfill the basic requirements?
1. Did you document the method for setting up and running your application?
1. Did you follow the instructions for submission?

Additionally, reviewers will attempt to assess your familiarity with standard libraries. Reviewers will also assess your experience with object-oriented programming based on how you've structured your submission.
