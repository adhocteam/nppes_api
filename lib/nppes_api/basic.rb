module NPPESApi
  class Basic
    def initialize(data)
      @data = data
    end

    methods = [
      :first_name,
      :last_name,
      :middle_name,
      :credential,
      :sole_proprietor,
      :gender,
      :enumeration_date,
      :last_updated,
      :status,
      :name_prefix,
      :name_suffix
    ]

    methods.each do |meth|
      define_method(meth) do
        @data[meth.to_s]
      end
    end
  end
end


