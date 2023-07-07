# RailsDatabaseAwait

This gem was created to solve the problem when you might have to wait until the database is ready before continuing.
For example when running migrations in a kubernetes job while using Google Cloud SQL Auth Proxy as a sidecar.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rails_database_await

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rails_database_await

## Usage

`bundle exec rails db:await`

Configure the number of times we should be trying to connect to the database by setting the `DATABASE_AWAIT_MAX_TRIES` (Defaults to 30).
Configure the number of seconds to wait between each time we try to connect to the database by setting the `DATABASE_AWAIT_WAIT_TIME` (Defaults to 1).

For example; To wait for the database to be ready before running migrations we can just do:

`bundle exec rails db:await db:migrate`

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apoex/rails_database_await.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
