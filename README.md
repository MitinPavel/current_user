# CurrentUser

Dev phase auth for Rails.

## What it is

* A simple authentication gem for the development (pre-production) phase
* Familiar rails conventions: #current_user, #signed_in? (and a few others) methods
* A convenient signin page with a list of all available users (just click on a user and you will be logged in under the user)
* An opportunity to replace it with one of the mature solution (assuming Devise)

## What it is not

* An authentication solution for the production phase of your application lifecycle
* An authorization gem (although in the future it might get some authorization features to mimic Devise)

## Getting started

CurrentUser works with Rails 3.2. Add it to your Gemfile with:

```ruby
gem 'current_user', :git => 'git://github.com/MitinPavel/current_user.git'
```

Install it using bundler:

```console
bundle install
```

__Note__: CurrentUser assumes your application already has a few users in its database. So if the assumption is false,
generate User activerecord model and insert users in db. It might look like:

```console
rails g model User email:string
bundle exec rake db:migrate
rails c
```

```ruby
User.create! :email => 'some.email@mailinator.com'
```

If there is no problem with users, run the generator:

```console
rails generate current_user:install
```

It creates a file with a unique key for your application. CurrentUser use the key to obscure access to the signin page.

Mount the CurrentUser engine and specify root in `config/routes.rb`:

```ruby
mount CurrentUser::Engine => '/current_user'
root :to => 'dashboards#show'
```

TODO
 * run the rake task to see how the signin url looks like
 * send an email to your customer