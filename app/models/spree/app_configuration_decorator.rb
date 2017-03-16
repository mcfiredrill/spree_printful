module Spree
  AppConfiguration.class_eval do
    preference :printful_api_key, :string
    preference :printful_gift_subject, :string
    preference :printful_gift_message, :text
    preference :printful_webhook_username, :string
    preference :printful_webhook_password, :string
  end
end
