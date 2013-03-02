require 'spec_helper'
require 'glasstrip/search'

describe GlassTrip::Search do

  let(:search) do
    described_class.new(
      from: "ATL",
      to: "JAX",
      depart_date: "2012-10-15",
      return_date: "2012-10-25",
      adults: "2",
      children: "1",
      infants: "1",
      carrier: ["AA", "DL"],
      cabin_type: "Economy",
      permitted_carriers: ["AA", "DL"],
      sort: "ASC"
    )
  end

  describe "#params" do
    it "creates a hash of options for search" do
      search.params.should == {
        "from"=>"ATL",
        "to"=>"JAX",
        "depart-date"=>nil,
        "return-date"=>"2012-10-25",
        "adults"=>"2",
        "children"=>"1",
        "infants"=>"1",
        "carrier"=>"AA-DL",
        "cabin-type"=>"Economy",
        "permitted-carriers"=>"AA-DL",
        "sort"=>"ASC"
      }
    end
  end

end
