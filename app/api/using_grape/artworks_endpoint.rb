module UsingGrape
  class ArtworksEndpoint < Grape::API
    format :json

    namespace :artworks do
      get do
        Artwork.all
      end
    end
  end
end
