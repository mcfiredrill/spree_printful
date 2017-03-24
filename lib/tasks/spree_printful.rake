namespace :spree_printful do
  desc 'Sync product and variant stock with printful'
  task update_stock: :environment do
    puts Spree::Variant.update_stock
  end
end
