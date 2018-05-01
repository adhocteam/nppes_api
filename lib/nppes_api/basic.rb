module NPPESApi
  class Basic
    def initialize(data)
      @data = data
    end

    methods = [
      :status,
      :credential,
      :first_name,
      :last_name,
      :middle_name,
      :name,
      :gender,
      :sole_proprietor,
      :last_updated,
      :enumeration_date
    ]

    methods.each do |meth|
      define_method(meth) do
        if @data.present?
          @data[meth.to_s]
        end
      end
    end
  end
end
