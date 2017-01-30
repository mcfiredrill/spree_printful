module Spree
  module Calculator::Shipping
    module Fedex
      class InternationalPriority < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("fedex.international_priority")
        end
        def self.printful_description
          "FEDEX_INTERNATIONAL_PRIORITY"
        end
      end
    end
  end
end
