class AddPrintfulVariantIdToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :printful_variant_id, :integer
  end
end
