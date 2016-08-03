module NppesApi
  class Address
    def initialize(data)
      @data = data
    end

    methods = [
      :address_1,
      :address_2,
      :city,
      :state,
      :postal_code,
      :telephone_number,
      :country_code,
      :country_name,
      :address_type,
      :address_purpose
    ]

    methods.each do |meth|
      define_method(meth) do
        @data[meth.to_s]
      end
    end
  end
end
