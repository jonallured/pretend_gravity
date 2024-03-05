require "rails_helper"

describe "GET /api/using_nothing/artworks/:id" do
  let!(:artwork) { FactoryBot.create(:artwork) }

  context "with invalid id" do
    it "returns a 404" do
      get "/api/using_nothing/artworks/invalid"
      expect(response.status).to eq 404
    end
  end

  context "with valid id" do
    it "returns that artwork" do
      get "/api/using_nothing/artworks/#{artwork.id}"
      expect(response.status).to eq 200
      expect(response.parsed_body).to eq artwork.as_json
    end
  end
end
