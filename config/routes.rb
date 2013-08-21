Spree::Core::Engine.routes.draw do
  namespace :admin do


    resources :dhl_shipping_methods do
      resources :dhl_shipping_zones, only: [:index, :new, :create]
      resources :dhl_surcharges, only: [:index, :new, :create]
    end

    resources :dhl_shipping_zones, except: [:index, :new, :create] do
      resources :dhl_country_zones, only: [:index, :new, :create]
    end

    resources :dhl_surcharges, except: [:index, :new, :create]
    resources :dhl_country_zones, except: [:index, :new, :create]
  end
end
