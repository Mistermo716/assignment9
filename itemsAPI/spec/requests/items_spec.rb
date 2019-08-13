require 'rspec'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

RSpec.describe "Items", type: :request do
  describe "GET /items" do
    it "works! (now write some real specs)" do
      get items_path
      expect(response).to have_http_status(200)
    end
  end
end
