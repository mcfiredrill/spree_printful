require "net/http"
require "uri"

Spree::Variant.class_eval do
  has_one :printful_printfile, as: :viewable, dependent: :destroy, class_name: "Spree::PrintfulPrintfile"
  accepts_nested_attributes_for :printful_printfile
  validate :printful_has_variant
  validates :printful_printfile, presence: true, if: Proc.new { |variant| variant.printful_variant_id.present? }
  after_create :update_printful_stock

  def is_printful_variant?
    self.printful_printfile.try(:attachment?) and self.printful_variant_id.present?
  end

  def get_printful_variant_details
    uri = URI.parse("http://api.printful.com")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/products/variant/#{self.printful_variant_id}")
    http.request(request)
  end

  def update_printful_stock
    stock_loc = Spree::StockLocation.where({name: 'printful'}).first_or_create
    if is_printful_variant?
      res = JSON.parse(get_printful_variant_details.body)
      if(res['result']['variant']['in_stock'])
        stock_items.where(stock_location: stock_loc).update(count_on_hand: 700000000)
      else
        stock_items.where(stock_location: stock_loc).update(count_on_hand: 0)
      end
    end
  end

  def self.update_stock
    Spree::Variant.where.not(printful_variant_id: nil).each do |vrnt|
      vrnt.update_printful_stock
    end
  end

  private
    def printful_has_variant
      if self.printful_variant_id
        case get_printful_variant_details
        when Net::HTTPSuccess
          return
        else
          self.errors[:printful_variant_id] << Spree.t(:invalid_printful_variant)
        end
      end
    end
end
