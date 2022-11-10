module NPPESApi
  class Address
    def initialize(data)
      @data = data
    end

    methods = [
      :country_code,
      :country_name,
      :address_purpose,
      :address_type,
      :address_1,
      :address_2,
      :city,
      :state,
      :postal_code,
      :telephone_number,
      :fax_number
    ]

    methods.each do |meth|
      define_method(meth) do
        @data[meth.to_s]
      end
    end
  end
end
