RSpec.feature 'Printful Settings' do
  stub_authorization!

  background do
    visit spree.admin_path
  end

  context 'edit' do
    background do
      click_link 'Printful Settings'
    end

    scenario 'when editing printful settings' do
      fill_in 'printful_api_key', with: 'PrintfulApiKey'
      fill_in 'printful_gift_subject', with: 'Store gift subject'
      fill_in 'printful_gift_message', with: 'Store gift message'
      click_button 'Update'
      expect(page).to have_content('successfully updated!')
      expect(Spree::Config[:printful_api_key]).to eq('PrintfulApiKey')
      expect(Spree::Config[:printful_gift_subject]).to eq('Store gift subject')
      expect(Spree::Config[:printful_gift_message]).to eq('Store gift message')
    end
  end
end
