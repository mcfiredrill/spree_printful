require "net/http"
require "uri"

Spree::Variant.class_eval do
  has_one :printful_printfile, as: :viewable, dependent: :destroy, class_name: "Spree::PrintfulPrintfile"
  accepts_nested_attributes_for :printful_printfile
  validate :printful_has_variant
  validates :printful_printfile, presence: true, if: Proc.new { |variant| variant.printful_variant_id.present? }

  def is_printful_variant?
    self.printful_printfile.attachment? and self.printful_variant_id.present?
  end

  private
    def printful_has_variant
      if self.printful_variant_id
        uri = URI.parse("http://api.printful.com")
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new("/products/variant/#{self.printful_variant_id}")
        response = http.request(request)
        case response
        when Net::HTTPSuccess
          return
        else
          self.errors[:printful_variant_id] << Spree.t(:invalid_printful_variant)
        end
      end
    end
end
