module UsingGrape
  class ArtworksEndpoint < Grape::API
    format :json

    namespace :artworks do
      get do
        Artwork.all.order(featured: :desc, created_at: :desc)
      end

      get ":id" do
        Artwork.find(params[:id])
      end

      params do
        requires :amount_cents, type: Integer
        requires :artist_name, type: String
        requires :medium, type: String
        requires :title, type: String
      end
      post do
        artwork = Artwork.new(declared(params, include_missing: false))
        if artwork.save
          artwork
        else
          errors = {errors: artwork.errors.full_messages.to_sentence}
          error! errors, 400
        end
      end

      params do
        optional :amount_cents, type: Integer
        optional :artist_name, type: String
        optional :medium, type: String
        optional :title, type: String
      end
      put ":id" do
        artwork = Artwork.find(params[:id])
        if artwork.update(declared(params, include_missing: false))
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
