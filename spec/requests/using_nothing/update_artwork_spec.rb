require "rails_helper"

describe "PUT /api/using_nothing/artworks/:id" do
  let(:artwork) { FactoryBot.create(:artwork, title: "Fooncy cup") }

  context "with invalid update" do
    it "returns 400 and the errors" do
      params = {title: ""}

      put "/api/using_nothing/artworks/#{artwork.id}", params: params

      expect(response.status).to eq 400
      expect(response.parsed_body.key?("errors")).to eq true
    end
  end

  context "with partial update" do
    it "returns 200 and that updated artwork" do
      params = {title: "Fancy cup"}

      put "/api/using_nothing/artworks/#{artwork.id}", params: params

      expect(response.status).to eq 200
      expect(response.parsed_body["title"]).to eq "Fancy cup"
    end
  end

  context "with full update" do
    it "returns a 200 and that updated artwork" do
      params = {
        amount_cents: 100_000,
        artist_name: "Sally Sculptor",
        medium: "Clay",
        title: "Fancy cup"
      }

      put "/api/using_nothing/artworks/#{artwork.id}", params: params

      expect(response.status).to eq 200
      expect(response.parsed_body["amount_cents"]).to eq 100_000
      expect(response.parsed_body["artist_name"]).to eq "Sally Sculptor"
      expect(response.parsed_body["medium"]).to eq "Clay"
      expect(response.parsed_body["title"]).to eq "Fancy cup"
    end
  end
end
