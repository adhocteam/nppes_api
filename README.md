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
The entrypoint for searches is at NPPESApi.search. See the code in `lib/nppes_api.rb` for information on the options that you can pass, which are the same as the ones [described by NPPES](https://npiregistry.cms.hhs.gov/api-page). A successful search will return an
`NPPESApi::SearchResults` object, from which you can call methods to retrieve data or call the `raw_data` method to get the original JSON.
Here is an example query:

```
NPPESApi.search(number: 1932494937).results.first.taxonomies.first.state #=> 'NC'
```

## Search Results Methods and Objects
A successful `NPPESApi.search()` call will return an `NPPESApi::SearchResults` object, which contains the following objects/methods:

- `raw_data`: The raw JSON returned by the NPPES API, as a Hash
- `result_count`: The number of results returned by the search
- `results`: An array of `NPPESApi::Provider` objects, which have the following objects/methods:
  - `created_epoch`
  - `enumeration_type`
  - `last_updated_epoch`
  - `number`
  - `other_names`
  - `identifiers`
  - `basic`: an `NPPESApi::Basic` object, which has the following objects/methods:
    - `first_name`
    - `last_name`
    - `middle_name`
    - `credential`
    - `sole_proprietor`
    - `gender`
    - `enumeration_date`
    - `last_updated`
    - `status`
    - `name_prefix`
    - `name_suffix`
  - `addresses`: An array of `NPPESApi::Address` objects, which have the following objects/methods:
    - `country_code`
    - `country_name`
    - `address_purpose`
    - `address_type`
    - `address_1`
    - `address_2`
    - `city`
    - `state`
    - `postal_code`
    - `telephone_number`
    - `fax_number`
  - `taxonomies`: An array of `NPPESApi::Taxonomy` objects, which have the following objects/methods:
    - `state`
    - `code`
    - `primary`
    - `license`
    - `des`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nppes_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
