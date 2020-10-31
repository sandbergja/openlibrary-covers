# Openlibrary::Covers

A very small gem that wraps the OpenLibrary's Covers API (https://openlibrary.org/dev/docs/api/covers).

Note that OpenLibrary says that "a courtesy link back to Open Library is appreciated".

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openlibrary-covers'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install openlibrary-covers

## Usage

    require 'openlibrary-covers'
    image = Openlibrary::Covers::Image.new '9780786965601'
    image.found? # => true
    image.url # => "http://covers.openlibrary.org/b/isbn/9780786965601-M.jpg"

    image_by_oclc_number = Openlibrary::Covers::Image.new '798147823', :oclc
    # Get a large image
    image_by_oclc_number.url :L # => "http://covers.openlibrary.org/b/oclc/798147823-L.jpg"

    invalid_image = Openlibrary::Covers::Image.new 'not-a-real-identifier'
    invalid_image.found? # => false
    invalid_image.url # => nil


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sandbergja/openlibrary-covers.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
