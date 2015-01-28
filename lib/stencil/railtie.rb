require 'rails'

module Stencil
  class Stencil::Railtie < Rails:: Railtie
    initializer "stencil.configure" do |app|
      Stencil::Config.add_to_paths ["#{app.config.root}/app/stencils"]
    end
  end
end
