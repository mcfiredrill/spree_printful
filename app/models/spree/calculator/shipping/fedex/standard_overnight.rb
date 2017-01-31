module Spree
  module Calculator::Shipping
    module Fedex
      class StandardOvernight < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.fedex.standard_overnight")
        end
        def printful_description
          "FEDEX_STANDARD_OVERNIGHT"
        end
      end
    end
  end
end
