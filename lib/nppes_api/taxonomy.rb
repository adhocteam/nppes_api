module NppesApi
  class Taxonomy
    def initialize(data)
      @data = data
    end

    methods = [
      :state,
      :code,
      :primary,
      :license,
      :desc
    ]

    methods.each do |meth|
      define_method(meth) do
        @data[meth.to_s]
      end
    end
  end
end
