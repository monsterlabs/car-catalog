CarCatalog::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :offers, :only => [:index, :show]
    end
  end
end
