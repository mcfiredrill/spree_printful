module Spree
  module Calculator::Shipping
    module Usps
      class ParcelSelect < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.usps.parcel_select")
        end
        def printful_description
          "USPS_PARCELSELECT"
        end
      end
    end
  end
end
