Spree::Order.class_eval do
  state_machine do
    after_transition :to => :complete, :do => :send_order_to_printful
  end

  def send_order_to_printful
    shipping_state = self.ship_address.state ? self.ship_address.state.abbr : self.ship_address.state_name
    printful_line_items = get_printful_line_items
    shipping_method = self.shipments.last.try(:shipping_method).try(:calculator).try(:printful_description) || "STANDARD"
    if printful_line_items.present? and Spree::Config.printful_api_key.present?
      pf = PrintfulClient.new(Spree::Config.printful_api_key)
      pp pf.post('orders',
        {
            external_id: self.number,
            shipping: shipping_method,
            recipient:  {
                name: self.ship_address.firstname + " " + self.ship_address.lastname,
                address1: self.ship_address.address1,
                address2: self.ship_address.address2,
                city: self.ship_address.city,
                state_code: shipping_state,
                country_code: self.ship_address.country.iso,
                zip: self.ship_address.zipcode,
                phone: self.ship_address.phone,
                email: self.email
            },
            items: printful_line_items,
            retail_costs: {
              shipping: self.shipment_total.to_s
            },
            gift: {
              subject: Spree::Config.printful_gift_subject,
              message: Spree::Config.printful_gift_message
            }
         }
      )
    end
  rescue PrintfulApiException, PrintfulException => e
    puts 'Printful exception: ' + e.message #Error while doing the request
  end

  private
    def get_printful_line_items
      printful_line_items = []
      self.line_items.each do |item|
        if item.variant.is_printful_variant?
          p "hello"
          p item.variant.printful_printfile.attachment.url(:original)
          printful_files = [ { url: item.variant.printful_printfile.attachment.url(:original) }, { type: 'preview', url: item.variant.product.images.first.attachment.url(:original) } ]
          line_item = {
            external_id: item.id,
            variant_id: item.variant.printful_variant_id,
            quantity: item.quantity,
            retail_price: item.price.to_s,
            name: item.variant.product.name,
            files: printful_files,
            sku: item.variant.sku
          }
          printful_line_items.push(line_item)
        end
      end
      printful_line_items
    end
end
