module UsingGrape
  class ArtworksEndpoint < Grape::API
    format :json

    helpers do
      def artwork_params
        params.permit(*Artwork.permitted_params)
      end
    end

    namespace :artworks do
      get do
        Artwork.all.order(featured: :desc, created_at: :desc)
      end

      get ":id" do
        Artwork.find(params[:id])
      end

      post do
        artwork = Artwork.new(artwork_params)
        if artwork.save
          artwork
        else
          errors = {errors: artwork.errors.full_messages.to_sentence}
          error! errors, 400
        end
      end

      put ":id" do
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
          artwork
        else
          errors = {errors: artwork.errors.full_messages.to_sentence}
          error! errors, 400
        end
      end

      delete ":id" do
        artwork = Artwork.find(params[:id])
        if artwork
          artwork.destroy
        else
          error!
        end
      end
    end
  end
end
