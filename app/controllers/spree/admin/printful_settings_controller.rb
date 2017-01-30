class Spree::Admin::PrintfulSettingsController < Spree::Admin::BaseController

  def edit
    @preferences_GeneralSettings = [:printful_api_key, :printful_gift_subject, :printful_gift_message]
  end

  def update
    params.each do |name, value|
      next unless Spree::Config.has_preference? name
      Spree::Config[name] = value
    end

    flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:printful_settings))
    redirect_to edit_admin_printful_settings_path
  end
end
