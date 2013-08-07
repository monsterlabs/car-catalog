CarCatalog::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root "rails_admin/main#dashboard"
  namespace :api do
    namespace :v1 do
      resources :offers, only: [:index, :show]
      resources :brands, only: [:index, :show]
      resources :specification_types, only: [:index, :show]
      get "/specificationtypes", to: "specification_types#index"
      get "/specificationtypes/:id", to: "specification_types#show"

      resources :specifications, only: [:index, :show]
      resources :comparatives, only: [:index, :show]

      resources :compared_features, only: [:index, :show]
      get "/comparedfeatures", to: "compared_features#index"
      get "/comparedfeatures/:id", to: "compared_features#show"
      resources :cars, only: [:index, :show]
      concern :carable do
        resources :cars, only: [:index, :show]
      end
      resources :lines, only: [:index, :show], concerns: :carable

      concern :lineable do
        resources :lines, only: [:index, :show], concerns: :carable
      end
      resources :series, only: [:index, :show], concerns: :lineable

      resources :compared_cars, only: [:index, :show]
      get "/comparedcars", to: "compared_cars#index"
      get "/comparedcars/:id", to: "compared_cars#show"

    end
  end
end
