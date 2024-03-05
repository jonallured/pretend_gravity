module Api
  module UsingNothing
    class ArtworksController < ApplicationController
      def index
        artworks = Artwork.all
        render json: artworks
      end
    end
  end
end
