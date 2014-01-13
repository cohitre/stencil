module Stencil
  module Config
    class << self
      def paths
        @paths ||= []
      end

      def default_template_finder
        finder = TemplateFinder.new
        finder.paths.concat self.paths
        finder.extensions.concat %w[haml erb]
        finder
      end
    end
  end
end
