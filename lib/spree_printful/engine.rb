module SpreePrintful
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_printful'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir[File.join(File.dirname(__FILE__), "../../app/models/spree/calculator/**/base.rb")].sort.each do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "printful_shipping.register.calculators", after: "spree.register.calculators" do |app|
     if app.config.spree.calculators.shipping_methods
       classes = Dir.chdir File.join(File.dirname(__FILE__), "../../app/models") do
         Dir["spree/calculator/shipping/**/*.rb"].reject {|path| path =~ /base.rb$/ }.map do |path|
           path.gsub('.rb', '').camelize.constantize
         end
       end

       app.config.spree.calculators.shipping_methods.concat classes
     end
   end
  end
end
