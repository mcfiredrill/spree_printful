module Spree
  module Calculator::Shipping
    module Fedex
      class Ground < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("fedex.ground")
        end
        def self.printful_description
          "FEDEX_GROUND"
        end
      end
    end
  end
end
