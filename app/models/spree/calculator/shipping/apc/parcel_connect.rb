module Spree
  module Calculator::Shipping
    module Apc
      class ParcelConnect < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("apc.parcel_connect")
        end
        def self.printful_description
          "APC_PARCEL_CONNECT"
        end
      end
    end
  end
end
