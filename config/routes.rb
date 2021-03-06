﻿PresenceManager::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get  '/users/auth/:action/', :to => 'users/omniauth_callbacks#action', :as => 'omniauth_authorize'

  namespace :api do
    resources :seats, only:[:index]
    resources :venues, only:[:index]
    resources :seminars, only:[] do
      collection do
        post 'attend'
        get 'detail'
      end
    end
  end

  resources :venues, only:[:index, :new, :create, :edit, :update] do
    resources :seats, only:[:index]
  end
  resources :seminars, only:[:index, :show, :create] do
    get 'attend', on: :collection
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'seminars#index'


  puts "active_record reset"
  begin
    Seminar.connection.schema_cache.clear!
    Seminar.reset_column_information
    Seat.reset_column_information
    Attend.reset_column_information
    NfcTag.reset_column_information
    #User.reset_column_information
    Venue.reset_column_information
  rescue =>e
    puts e.to_s
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
