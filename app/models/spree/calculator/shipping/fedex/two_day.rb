module Spree
  module Calculator::Shipping
    module Fedex
      class TwoDay < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("fedex.two_day")
        end
        def self.printful_description
          "FEDEX_2_DAY"
        end
      end
    end
  end
end
