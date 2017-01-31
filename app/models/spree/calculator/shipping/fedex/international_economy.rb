module Spree
  module Calculator::Shipping
    module Fedex
      class InternationalEconomy < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.fedex.international_economy")
        end
        def printful_description
          "FEDEX_INTERNATIONAL_ECONOMY"
        end
      end
    end
  end
end
