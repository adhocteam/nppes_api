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
      :name_suffix,
      :authorized_official_first_name,
      :authorized_official_last_name,
      :authorized_official_middle_name,
      :authorized_official_title_or_position,
      :authorized_official_telephone_number,
      :authorized_official_name_prefix,
      :authorized_official_name_suffix,
      :authorized_official_credential
    ]

    methods.each do |meth|
      define_method(meth) do
        @data[meth.to_s]
      end
    end
  end
end


