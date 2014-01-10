module Stencil
  module Config
    class << self
      attr_accessor :extra_template_paths

      def template_paths
        if defined?(Rails)
          Rails.template_paths + extra_template_paths
        else
          extra_template_paths
        end
      end
    end
  end
end
