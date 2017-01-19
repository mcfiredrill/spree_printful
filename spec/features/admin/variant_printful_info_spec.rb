RSpec.feature 'Variant Printful Info' do
  stub_authorization!

  scenario 'has printful variant fields' do
    variant = create(:variant)
    visit spree.edit_admin_product_variant_path(variant.product, variant)
    expect(page).to have_text 'Printful Variant ID'
    expect(page).to have_text 'Printful Printfile Attachment'
  end

  scenario 'updates variant with printful info' do
    variant = create(:variant)
    visit spree.edit_admin_product_variant_path(variant.product, variant)
    fill_in 'Printful Variant ID', with: '12345'
    page.attach_file('Printful Printfile Attachment', Rails.root.to_s.split('/')[0..-2].join('/') + '/fixtures/test.png')
    click_button 'Update'
    variant.reload
    expect(variant.printful_variant_id).to eq 12345
    expect(variant.printful_printfile).to_not be_nil
    expect(variant.printful_printfile.attachment).to_not be_nil
    expect(variant.printful_printfile.attachment.url).to match /test.png/
  end
  #
  #
  # within('#add-line-item') do
  #   select2_search other.name, from: 'Name or SKU'
  #   select2_search relation_type.name, from: 'Type'
  #   fill_in 'add_discount', with: '0.8'
  #   click_link 'Add'
  # end
  #
  # wait_for_ajax
  #
  # within_row(1) do
  #   expect(page).to have_field('relation_discount_amount', with: '0.8')
  #   expect(column_text(2)).to eq other.name
  #   expect(column_text(3)).to eq relation_type.name
  # end
  # context 'with relations' do
  #   given!(:relation) do
  #     create(:relation, relatable: product, related_to: other, relation_type: relation_type, discount_amount: 0.5)
  #   end
  #
  #   background do
  #     visit spree.edit_admin_product_path(product)
  #     click_link 'Related Products'
  #   end
  #
  #   scenario 'ensure content exist' do
  #     expect(page).to have_text 'Add Related Product'
  #     expect(page).to have_text product.name
  #     expect(page).to have_text other.name
  #
  #     within_row(1) do
  #       expect(page).to have_field('relation_discount_amount', with: '0.5')
  #       expect(column_text(2)).to eq other.name
  #       expect(column_text(3)).to eq relation_type.name
  #     end
  #   end
  #
  #   scenario 'update discount' do
  #     within_row(1) do
  #       fill_in 'relation_discount_amount', with: '0.9'
  #       click_on 'Update'
  #     end
  #     wait_for_ajax
  #     within_row(1) do
  #       expect(page).to have_field('relation_discount_amount', with: '0.9')
  #     end
  #   end
  #
  #   context 'delete' do
  #     scenario 'can remove records' do
  #       within_row(1) do
  #         expect(column_text(2)).to eq other.name
  #         click_icon :delete
  #       end
  #       page.driver.browser.switch_to.alert.accept unless Capybara.javascript_driver == :poltergeist
  #       wait_for_ajax
  #       expect(page).to have_text 'successfully removed!'
  #       expect(page).not_to have_text other.name
  #     end
  #   end
  # end
end
