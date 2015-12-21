require 'spec_helper'

describe Afterbuy::Representer::GetShopProductsRequestRepresenter do

  describe '#to_hash' do
    specify do
      request = Afterbuy::Representer::GetShopProductsRequestRepresenter.new(
        Afterbuy::GetShopProductsRequest.new(filter_name: "ProductID", filter_value: 12345)
      )

      expect(request.to_xml).to eq(
      "<Request>
  <DataFilter>&lt;Filter&gt;
  &lt;FilterName&gt;ProductID&lt;/FilterName&gt;
  &lt;FilterValues&gt;
    &lt;FilterValue&gt;12345&lt;/FilterValue&gt;
  &lt;/FilterValues&gt;
&lt;/Filter&gt;</DataFilter>
</Request>"
      )
    end
  end
end
