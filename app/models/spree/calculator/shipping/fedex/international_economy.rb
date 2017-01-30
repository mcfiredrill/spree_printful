module Spree
  module Calculator::Shipping
    module Fedex
      class InternationalEconomy < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("fedex.international_economy")
        end
        def self.printful_description
          "FEDEX_INTERNATIONAL_ECONOMY"
        end
      end
    end
  end
end
