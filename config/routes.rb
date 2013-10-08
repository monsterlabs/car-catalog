CarCatalog::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root "rails_admin/main#dashboard"
  namespace :api do
    namespace :v1 do
      resources :offers, only: [:index, :show]
      resources :brands, only: [:index, :show]
      resources :specification_types, only: [:index, :show]
      resources :compared_cars, only: [:index, :show]

      resources :compared_features, only: [:index, :show]
      concern :compared_featurable do
        resources :compared_features, only: [:index, :show]
      end

      resources :comparatives, only: [:index, :show]
      concern :comparable do
        resources :comparatives, only: [:index, :show], concerns: :compared_featurable
      end

      resources :features, only: [:index, :show]
      concern :featurable do
        resources :features, only: [:index, :show]
      end

      resources :specifications, only: [:index, :show]
      concern :specificationable do
        resources :specifications, only: [:index, :show], concerns: [:featurable, :comparable]
      end

      resources :cars, only: [:index, :show], concerns: :specificationable
      concern :carable do
        resources :cars, only: [:index, :show], concerns: :specificationable
      end

      resources :lines, only: [:index, :show], concerns: :carable
      concern :lineable do
        resources :lines, only: [:index, :show], concerns: :carable
      end

      resources :series, only: [:index, :show], concerns: :lineable

      post 'push_notification_devices/', to: 'push_notification_devices#create', as: 'push_notification_devices'
    end
  end
end
