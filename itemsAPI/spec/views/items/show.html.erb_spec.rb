require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :price => 2.5,
      :description => "Description",
      :stockQty => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/3/)
  end
end
