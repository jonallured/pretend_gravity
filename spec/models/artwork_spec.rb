require "rails_helper"

describe Artwork do
  describe "validation" do
    context "without required fields" do
      it "is not valid" do
        artwork = Artwork.new
        expect(artwork).to_not be_valid
      end
    end

    context "with required fields" do
      it "is valid" do
        artwork = Artwork.new(
          amount_cents: 45_000,
          artist_name: "Sally Sculptor",
          medium: "Clay",
          title: "Fancy cup"
        )
        expect(artwork).to be_valid
      end
    end
  end

  describe "defaults" do
    it "sets featured to false by default" do
      artwork = Artwork.new
      expect(artwork.featured).to eq false
    end
  end
end
