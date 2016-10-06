require 'spec_helper'

describe Spree::Admin::PrintfulSettingsController, type: :controller do
  stub_authorization!

  context '#edit' do
    it 'should render the edit' do
      spree_get :edit
      expect(response).to render_template('edit')
    end
  end

  context '#update' do
    before do
      spree_put :update, printful_api_key: 'PrintfulApiKey'
    end
    it 'reidirects to edit' do
      expect(response).to redirect_to(edit_admin_printful_settings_path)
    end
  end
end
