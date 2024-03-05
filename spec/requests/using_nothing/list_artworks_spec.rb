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
      FactoryBot.create(:artwork, title: "middle artwork", created_at: 2.days.ago)
      FactoryBot.create(:artwork, title: "oldest artwork", created_at: 3.days.ago)
      FactoryBot.create(:artwork, title: "newest artwork", created_at: 1.days.ago)
    end

    it "returns those artworks sorted by newest first" do
      get "/api/using_nothing/artworks"
      expect(response.status).to eq 200

      expected_values = [
        ["newest artwork"],
        ["middle artwork"],
        ["oldest artwork"]
      ]

      actual_values = response.parsed_body.map do |artwork|
        artwork.values_at("title")
      end

      expect(actual_values).to eq expected_values
    end
  end
end
