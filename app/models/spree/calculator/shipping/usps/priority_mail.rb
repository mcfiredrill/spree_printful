module Spree
  module Calculator::Shipping
    module Usps
      class PriorityMail < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("usps.priority_mail")
        end
        def self.printful_description
          "USPS_PRIORITYMAIL"
        end
      end
    end
  end
end
