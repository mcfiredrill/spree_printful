module Spree
  module Calculator::Shipping
    module Fedex
      class ExpressSaver < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.fedex.express_saver")
        end
        def printful_description
          "FEDEX_EXPRESS_SAVER"
        end
      end
    end
  end
end
