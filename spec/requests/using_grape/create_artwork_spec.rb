require "rails_helper"

describe "POST /api/using_grape/artworks" do
  context "without required params" do
    it "returns a 400 and the errors" do
      params = {}
      post "/api/using_grape/artworks", params: params
      expect(response.status).to eq 400
      expect(response.parsed_body.key?("errors")).to eq true
    end
  end

  context "with required params" do
    it "returns a 201 and the new artwork" do
      params = {
        amount_cents: 100_000,
        artist_name: "Sally Sculptor",
        medium: "Clay",
        title: "Fancy cup"
      }
      post "/api/using_grape/artworks", params: params
      expect(response.status).to eq 201
      artwork = Artwork.last
      expect(response.parsed_body).to eq artwork.as_json
    end
  end

  context "with bonus param" do
    it "ignores that param" do
      params = {
        amount_cents: 100_000,
        artist_name: "Sally Sculptor",
        featured: true,
        medium: "Clay",
        title: "Fancy cup"
      }
      post "/api/using_grape/artworks", params: params
      expect(response.status).to eq 201
      expect(response.parsed_body["featured"]).to eq false
    end
  end
end
