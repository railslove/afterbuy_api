class Afterbuy::TestRepresenter < Roar::Decorator
  include Roar::XML

    nested :filter, as: :Filter, wrap: :DataFilter do
      property :filter_name, as: :FilterName, getter: lambda {|*| "ProductID" }
      property :filter_value, as: :FilterValue, wrap: :FilterValues, getter: lambda {|*| self[:afterbuy_product_ids].join(";") }
    end

end