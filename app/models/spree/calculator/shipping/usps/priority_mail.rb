module Spree
  module Calculator::Shipping
    module Usps
      class PriorityMail < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("spree_printful.usps.priority_mail")
        end
        def printful_description
          "USPS_PRIORITYMAIL"
        end
      end
    end
  end
end
