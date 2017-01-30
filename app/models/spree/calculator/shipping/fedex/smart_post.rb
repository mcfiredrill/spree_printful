module Spree
  module Calculator::Shipping
    module Fedex
      class SmartPost < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("fedex.smart_post")
        end
        def self.printful_description
          "FEDEX_SMART_POST"
        end
      end
    end
  end
end
