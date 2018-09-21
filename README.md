# Top Movies

<!-- Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/top_movies`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem -->
Top Movies is a command-line app that allows the user to see information about the top ten movies based on their box office earnings from the most recent weekend. When the user launches the app, they will see a list of movies and be asked to enter the number corresponding to a movie on the list to see its details. The user will also be given the option to see the list again, or quit the app at any point while using the app.

There are 3 classes in this project: a `Movie` class to represent each movie and store them in an array, a `Scraper` class to scrape the information from RottenTomatoes, and a `CommandLineInterface` class to interact with the user.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'top_movies'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install top_movies

## Usage

<!-- TODO: Write usage instructions here -->
To run the app, simply run the executable file in `bin/run`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'jmei403'/top_movies. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TopMovies project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'jmei403'/top_movies/blob/master/CODE_OF_CONDUCT.md).
