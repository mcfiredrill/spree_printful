require 'spec_helper'

RSpec.feature 'Add Printful Product From Product List Page' do
  stub_authorization!

  background do
    visit spree.admin_products_path
  end

  context 'index' do
    scenario 'when on product page' do
      expect(page).to have_content('New Printful Product')
      click_link "New Printful Product"
      expect(page).to have_content("New Printful Product")
    end
  end
end
