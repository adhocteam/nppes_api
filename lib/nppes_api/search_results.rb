require 'multi_json'

module NPPESApi
  class SearchResults
    def initialize(raw_data)
      @data = MultiJson.load(raw_data)
    end

    def raw_data
      @data
    end

    def result_count
      @data['result_count']
    end

    def results
      @results ||= begin
        if @data['results'].present?
          @data['results'].map { |i| Provider.new(i) }
        else
          []
        end
      end
    end
  end
end
