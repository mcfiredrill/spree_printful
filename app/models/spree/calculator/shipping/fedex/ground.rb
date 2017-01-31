module Spree
  module Calculator::Shipping
    module Fedex
      class Ground < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.fedex.ground")
        end
        def printful_description
          "FEDEX_GROUND"
        end
      end
    end
  end
end
