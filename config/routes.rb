Spree::Core::Engine.routes.draw do
  post "/printful/webhook", to: "printful#webhook", as: :printful_webhook
  namespace :admin, path: Spree.admin_path do
    resource  :printful_settings, only: [:edit, :update]
  end
end
