module Stencil
  module Config
    class << self
      def add_to_paths(new_paths)
        self.paths.concat new_paths
      end

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
