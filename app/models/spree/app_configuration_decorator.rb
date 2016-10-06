module Spree
  AppConfiguration.class_eval do
    preference :printful_api_key, :string
  end
end
