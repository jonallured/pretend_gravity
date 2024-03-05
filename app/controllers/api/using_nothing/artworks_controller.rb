module Api
  module UsingNothing
    class ArtworksController < ApplicationController
      def index
        artworks = Artwork.all
        render json: artworks
      end

      def show
        artwork = Artwork.find(params[:id])
        render json: artwork
      end
    end
  end
end
