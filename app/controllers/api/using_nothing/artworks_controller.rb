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

      def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
          render json: artwork, status: :created
        else
          errors = {errors: artwork.errors.full_messages.to_sentence}
          render json: errors, status: :bad_request
        end
      end

      def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
          render json: artwork
        else
          errors = {errors: artwork.errors.full_messages.to_sentence}
          render json: errors, status: :bad_request
        end
      end

      private

      def artwork_params
        params.permit(:amount_cents, :artist_name, :medium, :title)
      end
    end
  end
end
