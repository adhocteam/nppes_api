module NPPESApi
  class Provider
    def initialize(data)
      @data = data
    end

    def taxonomies
      @taxonomies ||= @data['taxonomies'].map { |i| Taxonomy.new(i) }
    end

    def addresses
      @addresses ||= @data['addresses'].map { |i| Address.new(i) }
    end

    def basic
      @basic = Basic.new(@data['basic'])
    end

    [:created_epoch, :last_updated_epoch, :number, :other_names, :identifiers].each do |meth|
      define_method(meth) do
        @data[meth.to_s]
      end
    end
  end
end
