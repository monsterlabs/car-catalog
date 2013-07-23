CarCatalog::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :offers, :only => [:index, :show]
      resources :brands, :only => [:index, :show]
      resources :carlines, :only => [:index, :show]
      concern :carlineable do
        resources :carlines, :only => [:index, :show]
      end
      resources :series, :only => [:index, :show], concerns: :carlineable do
        get 'carLines', to: 'carlines#index'
      end
    end
  end
end
