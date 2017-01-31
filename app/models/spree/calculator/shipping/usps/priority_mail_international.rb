module Spree
  module Calculator::Shipping
    module Usps
      class PriorityMailInternational < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.usps.priority_mail_international")
        end
        def printful_description
          "USPS_PRIORITYMAILINTERNATIONAL"
        end
      end
    end
  end
end
