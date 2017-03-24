class Spree::Admin::PrintfulSettingsController < Spree::Admin::BaseController

  def edit
    @preferences_GeneralSettings = [[:printful_api_key, :string], [:printful_gift_subject, :string], [:printful_gift_message, :text]]
    @preferences_WebhookSettings = [[:printful_webhook_username, :string], [:printful_webhook_password, :password]]
  end

  def update
    params['printful_webhook_password'] ||= params['printful_webhook_username']
    params.each do |name, value|
      next unless Spree::Config.has_preference? name
      Spree::Config[name] = value
    end

    begin
      pf = PrintfulClient.new(Spree::Config.printful_api_key)
      pp = pf.post('webhooks', {url: printful_webhook_url(printful_webhook_username:Spree::Config[:printful_webhook_username], printful_webhook_password: Spree::Config[:printful_webhook_password]), types: ['package_shipped', 'order_failed', 'order_canceled']})
      flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:printful_settings))
    rescue PrintfulApiException, PrintfulException, URI::InvalidURIError => e
      puts 'Printful exception: ' + e.message #Error while doing the request
      flash[:error] = Spree.t(:error_occured, resource: Spree.t(:printful_settings))
    end

    redirect_to edit_admin_printful_settings_path
  end
end
