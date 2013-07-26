CarCatalog::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root "rails_admin/main#dashboard"
  namespace :api do
    namespace :v1 do
      resources :offers, :only => [:index, :show]
      resources :brands, :only => [:index, :show]
      resources :specification_types, :only => [:index, :show]
      resources :cars, :only => [:index, :show]
      concern :carable do
        resources :cars, :only => [:index, :show]
      end
      resources :lines, :only => [:index, :show], concerns: :carable

      concern :lineable do
        resources :lines, :only => [:index, :show], concerns: :carable
      end
      resources :series, :only => [:index, :show], concerns: :lineable
    end
  end
end
