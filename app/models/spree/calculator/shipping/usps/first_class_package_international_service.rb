module Spree
  module Calculator::Shipping
    module Usps
      class FirstClassPackageInternationalService < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.usps.first_class_package_international_service")
        end
        def printful_description
          "USPS_FIRSTCLASSPACKAGEINTERNATIONALSERVICE"
        end
      end
    end
  end
end
