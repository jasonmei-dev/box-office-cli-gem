# BoxOfficeCLI

A simple command-line interface gem that scrapes a website and provides information on movies from last weekend's box office.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'box_office'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install box_office

## Usage

To start the app, simply run the executable file `bin/box-office`.

When the user launches the app, they will see a list of movies and be asked to enter the number corresponding to the movie to see more details. The user will also be given the option to see the list again, or quit at any point while using the app.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'jmei403'/box-office-cli-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BoxOfficeCLI project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'jmei403'/box-office-cli-gem/blob/master/CODE_OF_CONDUCT.md).
