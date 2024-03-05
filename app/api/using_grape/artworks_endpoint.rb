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
    end
  end
end
