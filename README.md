# CurrentUser

Dev phase auth for Rails.

## What it is

* A simple authentication gem for the development (pre-production) phase
* Familiar rails conventions: #current_user, #signed_in?
* A convenient signin page with a list of all available users (just click on a user and you will be logged in under the user)
* An opportunity to replace it with one of the mature solution (assuming Devise)

## What it is not

* An authentication solution for the production phase of the application lifecycle
* An authorization gem (although in the future it might get some authorization features to mimic Devise)

## Getting started

CurrentUser works with Rails 3.2. Add to your Gemfile:

```ruby
gem 'current_user', :git => 'git://github.com/MitinPavel/current_user.git'
```

Install it using bundler:

```console
bundle install
```

__Note__: CurrentUser assumes your application already has a few users in its database.
So if the assumption is false, please see "Add users to database" section
and return to the getting started guide.

Run the generator:

```console
rails generate current_user:install
```

The generator:
* creates a file with a unique authentication key for your application
* creates an initializer
* inject routing to your application
* show README

Specify root in `config/routes.rb`:

```ruby
root :to => 'dashboards#show'
```

Add before filter to `app/controllers/application_controller.rb`:

 ```ruby
before_filter :authenticate_user!
 ```

Try to visit one of protected pages of your application (for example root). You will see "Unauthorized" error page.

Run a rake task what shows a path to your sign in page:
```console
rake current_user:sign_in_path
```

Visit your sign in page. You will see a list of users of your application. Click on a user and the link
will take you to the root page of the application.

Congratulations. Your application has a simple authentication solution.

## Add users to database

CurrentUser assumes your application already has a few users in a database.
So if the assumption is false, generate User activerecord model and insert users in db. It might look like:

```console
rails g model User email:string
bundle exec rake db:migrate
rails c
```

```ruby
User.create! :email => 'some.email@mailinator.com'
```

## License

It uses MIT license. See MIT-LICENSE file in the root directory.