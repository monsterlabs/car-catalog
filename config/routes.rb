CarCatalog::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :offers, :only => [:index, :show]
      resources :brands, :only => [:index, :show]
      resources :carmodels, :only => [:index, :show]
      concern :carmodelable do
        resources :carmodels, :only => [:index, :show]
      end
      resources :series, :only => [:index, :show], concerns: :carmodelable do
        get 'carModels', to: 'carmodels#index'
      end
    end
  end
end
