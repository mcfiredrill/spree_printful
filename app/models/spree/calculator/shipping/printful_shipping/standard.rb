module Spree
  module Calculator::Shipping
    module PrintfulShipping
      class Standard < Base
        def self.description
          I18n.t("printful_shipping.standard")
        end
        def self.printful_description
          "STANDARD"
        end
      end
    end
  end
end
