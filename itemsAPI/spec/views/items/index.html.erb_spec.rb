require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :price => 2.5,
        :description => "Description",
        :stockQty => 3
      ),
      Item.create!(
        :price => 2.5,
        :description => "Description",
        :stockQty => 3
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
