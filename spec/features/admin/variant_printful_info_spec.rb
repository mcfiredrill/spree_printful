RSpec.feature 'Variant Printful Info' do
  stub_authorization!

  context "without printful api_key" do
    before do
      Spree::Config[:printful_api_key] = ''
    end
    scenario 'has printful variant fields' do
      variant = create(:variant)
      visit spree.edit_admin_product_variant_path(variant.product, variant)
      expect(page).to_not have_text 'Printful Variant ID'
      expect(page).to_not have_text 'Printful Printfile Attachment'
    end
  end

  context "with printful api_key" do
    before do
      Spree::Config[:printful_api_key] = 'PrintfulApiKey'
    end

    scenario 'has printful variant fields' do
      variant = create(:variant)
      visit spree.edit_admin_product_variant_path(variant.product, variant)
      expect(page).to have_text 'Printful Variant ID'
      expect(page).to have_text 'Printful Printfile Attachment'
    end

    scenario 'throws error with invalid variant id' do
      variant = create(:variant)
      visit spree.edit_admin_product_variant_path(variant.product, variant)
      fill_in 'Printful Variant ID', with: 'wq2qws'
      page.attach_file('Printful Printfile Attachment', Rails.root.to_s.split('/')[0..-2].join('/') + '/fixtures/test.png')
      click_button 'Update'
      expect(page).to have_text 'Invalid printful variant'
      variant.reload
      expect(variant.printful_variant_id).to be_nil
    end

    scenario 'throws error with invalid variant id' do
      variant = create(:variant)
      visit spree.edit_admin_product_variant_path(variant.product, variant)
      fill_in 'Printful Variant ID', with: '7681'
      click_button 'Update'
      expect(page).to have_text 'Printful printfile can\'t be blank'
      variant.reload
      expect(variant.printful_variant_id).to be_nil
      expect(variant.printful_printfile).to be_nil
    end

    scenario 'updates variant with printful info' do
      variant = create(:variant)
      visit spree.edit_admin_product_variant_path(variant.product, variant)
      fill_in 'Printful Variant ID', with: '7681'
      page.attach_file('Printful Printfile Attachment', Rails.root.to_s.split('/')[0..-2].join('/') + '/fixtures/test.png')
      click_button 'Update'
      variant.reload
      expect(variant.printful_variant_id).to eq 7681
      expect(variant.printful_printfile).to_not be_nil
      expect(variant.printful_printfile.attachment).to_not be_nil
      expect(variant.printful_printfile.attachment.url).to match /test.png/
    end
  end
end
