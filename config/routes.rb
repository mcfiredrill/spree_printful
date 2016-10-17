Spree::Core::Engine.routes.draw do
  namespace :admin, path: Spree.admin_path do
    resources :printful_products
    resource  :printful_settings, only: [:edit, :update]
  end
end
