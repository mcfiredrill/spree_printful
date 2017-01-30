module Spree
  module Calculator::Shipping
    module PrintfulShipping
      class Base < ShippingCalculator
        def self.service_name
          self.description
        end

        def available?(package)
          !compute(package).nil?
        end

        def compute_package(package)
          order = package.order
          destination = order.ship_address
          rates_result = retrieve_rates_from_cache(package, destination)
          return nil if rates_result.empty?
          return rates_result.detect {|rate| rate["id"] == self.class.printful_description }.to_f
        end

        private
          def package_items_for_printful(package)
            package_items = []
            package.contents.each do |content_item|
              package_items << { variant_id: content_item.variant.printful_variant_id, quantity: content_item.quantity } if content_item.variant.is_printful_variant?
            end
            package_items
          end

          def fetch_best_state_from_address address
            address.state ? address.state.abbr : address.state_name
          end

          def build_location address
            { address1: address.address1, city: address.city, country_code: address.country.iso, state_code: fetch_best_state_from_address(address), zip: address.zipcode }
          end

          def retrieve_rates destination, package_items
            pf = PrintfulClient.new(Spree::Config.printful_api_key)
            rates_result = pf.post('shipping/rates',{
                recipient: build_location(order.ship_address),
                items: package_items
            })
            return rates_result
          rescue PrintfulApiException, PrintfulException => e
            puts 'Printful exception: ' + e.message
            return nil
          end

          def retrieve_rates_from_cache package, destination
            Rails.cache.fetch(cache_key(package)) do
              package_items = package_items_for_printful(package)
              if shipment_packages.empty?
                []
              else
                retrieve_rates(destination, package_items)
              end
            end
          end
      end
    end
  end
end
