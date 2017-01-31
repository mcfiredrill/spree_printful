module Spree
  module Calculator::Shipping
    module Fedex
      class InternationalPriority < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.fedex.international_priority")
        end
        def printful_description
          "FEDEX_INTERNATIONAL_PRIORITY"
        end
      end
    end
  end
end
