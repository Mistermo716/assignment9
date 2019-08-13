require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :price => 1.5,
      :description => "MyString",
      :stockQty => 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[description]"

      assert_select "input[name=?]", "item[stockQty]"
    end
  end
end
