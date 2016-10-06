Spree::Core::Engine.routes.draw do
  namespace :admin, path: Spree.admin_path do
    resource :printful_settings, only: [:edit, :update]
  end
end
