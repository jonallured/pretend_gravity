require "rails_helper"

describe "DELETE /api/using_nothing/artworks/:id" do
  let(:artwork) { FactoryBot.create(:artwork) }

  context "with an invalid id" do
    it "returns a 404" do
      delete "/api/using_nothing/artworks/invalid"
      expect(response.status).to eq 404
    end
  end

  context "with a valid id" do
    it "returns a 200" do
      delete "/api/using_nothing/artworks/#{artwork.id}"
      expect(response.status).to eq 200
      expect(Artwork.count).to eq 0
    end
  end
end
