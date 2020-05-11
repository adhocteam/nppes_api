require 'nppes_api/version'

require 'rest-client'

require_relative 'nppes_api/address'
require_relative 'nppes_api/basic'
require_relative 'nppes_api/provider'
require_relative 'nppes_api/search_results'
require_relative 'nppes_api/taxonomy'

module NPPESApi
  ENUMERATION_TYPES = [
    NPI_1 = 'NPI-1'.freeze,
    NPI_2 = 'NPI-2'.freeze
  ].freeze

  ADDRESS_PURPOSES = [
    LOCATION = 'LOCATION'.freeze,
    MAILING = 'MAILING'.freeze
  ].freeze

  # This is the main entry point for searches. Provide params as described below to parameterize the search. Search results can consist
  # of at most 1200 results, and each search can return at most 200 of them. Use the limit and skip parameters as described below to
  # perform pagination of the data.
  # {https://npiregistry.cms.hhs.gov/registry/help-api}
  # @param number [Integer] An NPI number to search with. Must be exactly 10 characters
  # @param enumeration_type [String] One of the ENUMERATION_TYPES from above. NPI_1 is an individual search, and NPI_2 is organizations.
  #        Will search across both types if unspecified.
  # @param taxonomy_description [String] Specialty or Description. Can include a wildcard (*) after at least two characters
  # @param first_name [String] Exact name or include a wildcard after two characters. Only valid for type 1 searches.
  # @param last_name [String] Exact name or include a wildcard after two characters. Only valid for type 1 searches.
  # @param organization_name [String] Exact name or include a wildcard after two characters. Only valid for type 2 searches.
  # @param address_purpose [String] One of the ADDRESS_PURPOSES above. Requires other criteria.
  # @param city [String] Exact city name, no wildcards
  # @param state [String] 2-character abbreviation, requires other criteria
  # @param postal_code [String] At least two characters, wildcard is implied
  # @param country_code [String] Exactly two characters. If "US" other criteria are required
  # @param limit [Integer] Limit results, default = 10, max = 200
  # @param skip [Integer] Skip first N results, max = 1000
  def self.search(options = {})
    SearchResults.new(RestClient.get('https://npiregistry.cms.hhs.gov/api', params: options).body)
  end
end
