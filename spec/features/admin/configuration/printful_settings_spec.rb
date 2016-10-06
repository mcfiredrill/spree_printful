RSpec.feature 'Printful Settings' do
  stub_authorization!

  background do
    visit spree.admin_path
  end

  context 'edit' do
    background do
      click_link 'Printful Settings'
    end

    scenario 'can edit printful settings' do
      fill_in 'printful_api_key', with: 'PrintfulApiKey'
      click_button 'Update'
      expect(page).to have_content('successfully updated!')
      expect(Spree::Config[:printful_api_key]).to eq('PrintfulApiKey')
    end
  end
end
