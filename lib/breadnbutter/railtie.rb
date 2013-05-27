require 'breadnbutter/helpers'
module BreadnButter
  class Railtie < Rails::Railtie
    initializer "breadnbutter.view_helpers" do
      ActionView::Base.send :include, Helpers
    end
  end
end
