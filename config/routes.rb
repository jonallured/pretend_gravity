Rails.application.routes.draw do
  namespace :api do
    namespace :using_grape do
      mount UsingGrape::ArtworksEndpoint, at: "/"
    end

    namespace :using_nothing do
      resources :artworks
    end
  end
end
