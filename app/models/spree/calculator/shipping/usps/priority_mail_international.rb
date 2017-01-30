module Spree
  module Calculator::Shipping
    module Usps
      class PriorityMailInternational < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("usps.priority_mail_international")
        end
        def self.printful_description
          "USPS_PRIORITYMAILINTERNATIONAL"
        end
      end
    end
  end
end
