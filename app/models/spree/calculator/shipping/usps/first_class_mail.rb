module Spree
  module Calculator::Shipping
    module Usps
      class FirstClassMail < Spree::Calculator::Shipping::PrintfulShipping::Base
        def self.description
          I18n.t("usps.first_class_mail")
        end
        def self.printful_description
          "USPS_FIRSTCLASSMAIL"
        end
      end
    end
  end
end
