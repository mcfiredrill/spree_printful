module Spree
  module Calculator::Shipping
    module PrintfulShipping
      class Standard < Base
        def self.description
          I18n.t("spree_printful.printful_shipping.standard")
        end
        def printful_description
          "STANDARD"
        end
      end
    end
  end
end
