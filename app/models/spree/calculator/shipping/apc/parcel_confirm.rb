module Spree
  module Calculator::Shipping
    module Apc
      class ParcelConfirm < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("apc.parcel_confirm")
        end
        def self.printful_description
          "APC_PARCEL_CONFIRM"
        end
      end
    end
  end
end
