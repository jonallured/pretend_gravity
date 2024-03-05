module UsingGrape
  class ArtworksEndpoint < Grape::API
    format :json

    namespace :artworks do
      get do
        Artwork.all
      end

      get ":id" do
        Artwork.find(params[:id])
      end

      post do
        artwork = Artwork.new(params)
        if artwork.save
          artwork
        else
          errors = {errors: artwork.errors.full_messages.to_sentence}
          error! errors, 400
        end
      end
    end
  end
end
