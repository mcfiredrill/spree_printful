class AddPrintfulVariantIdToSpreeVariants < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_variants, :printful_variant_id, :integer
  end
end
