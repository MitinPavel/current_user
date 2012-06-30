# CurrentUser

Dev phase auth for Rails.

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


