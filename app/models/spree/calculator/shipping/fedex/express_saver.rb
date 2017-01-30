module Spree
  module Calculator::Shipping
    module Fedex
      class ExpressSaver < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("fedex.express_saver")
        end
        def self.printful_description
          "FEDEX_EXPRESS_SAVER"
        end
      end
    end
  end
end
