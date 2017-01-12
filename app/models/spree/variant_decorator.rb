Spree::Variant.class_eval do
  has_one :printful_printfile, as: :viewable, dependent: :destroy, class_name: "Spree::Image"
  accepts_nested_attributes_for :printful_printfile
end
