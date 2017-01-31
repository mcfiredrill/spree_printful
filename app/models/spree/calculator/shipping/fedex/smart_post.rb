module Spree
  module Calculator::Shipping
    module Fedex
      class SmartPost < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.fedex.smart_post")
        end
        def printful_description
          "FEDEX_SMART_POST"
        end
      end
    end
  end
end
