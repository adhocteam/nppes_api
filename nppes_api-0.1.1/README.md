# NPPES Api

This is a Ruby wrapper for the [NPPES NPI Registry API](https://npiregistry.cms.hhs.gov/registry/help-api). It provides a simple
query interface and returns data either in raw JSON format or wrapped with queryable Ruby objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nppes_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nppes_api

## Usage

The entrypoint for searches is at NPPESApi.search. See the code in lib/nppes_api.rb for information on the options that you can pass,
which are the same as the ones [described by NPPES](https://npiregistry.cms.hhs.gov/api/demo). A successful search will return an
NPPESApi::SearchResults object, from which you can call methods to retrieve data or call the raw_data method to get the original JSON.
Here is an example query:

```
NPPESApi.search(number: 1932494937).results.first.taxonomies.first.state #=> 'NC'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nppes_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
