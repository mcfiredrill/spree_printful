module Spree
  module Calculator::Shipping
    module Usps
      class ParcelSelect < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("usps.parcel_select")
        end
        def self.printful_description
          "USPS_PARCELSELECT"
        end
      end
    end
  end
end
