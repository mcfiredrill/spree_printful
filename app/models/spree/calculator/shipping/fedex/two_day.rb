module Spree
  module Calculator::Shipping
    module Fedex
      class TwoDay < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.fedex.two_day")
        end
        def printful_description
          "FEDEX_2_DAY"
        end
      end
    end
  end
end
