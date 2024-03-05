require "rails_helper"

describe "GET /api/using_nothing/artworks" do
  context "without any artworks" do
    it "returns an empty array" do
      get "/api/using_nothing/artworks"
      expect(response.status).to eq 200
      expect(response.parsed_body).to eq []
    end
  end

  context "with an artwork" do
    let!(:artwork) { FactoryBot.create(:artwork) }

    it "returns that artwork" do
      get "/api/using_nothing/artworks"
      expect(response.status).to eq 200
      expect(response.parsed_body).to eq [artwork].as_json
    end
  end

  context "with a few artworks" do
    before do
      FactoryBot.create_list(:artwork, 3)
    end

    it "returns those artworks" do
      get "/api/using_nothing/artworks"
      expect(response.status).to eq 200
      expect(response.parsed_body.count).to eq 3
    end
  end
end
