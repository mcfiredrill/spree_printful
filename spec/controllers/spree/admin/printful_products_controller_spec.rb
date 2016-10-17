require 'spec_helper'

RSpec.describe Spree::Admin::PrintfulProductsController, type: :controller do
  stub_authorization!

  context '#new' do
    it 'should render the edit' do
      spree_get :new
      expect(response).to render_template('new')
    end
  end
end
