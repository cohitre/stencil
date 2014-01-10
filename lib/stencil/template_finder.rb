module Stencil
  class TemplateNotFoundError < StandardError
    def initialize(object, file)
      @object = object
      @file = file
    end
  end

  class TemplateFinder
    attr_reader :paths
    attr_reader :extensions

    def initialize
      @paths = []
      @extensions = []
    end

    def find_all(file)
      @paths.map do |path|
        files(path, file)
      end.flatten.compact
    end

    def find(file)
      find_all(file).first || raise(TemplateNotFoundError.new(self, file))
    end

    def glob_string(path, filename)
      File.join(path, "#{filename}.*")
    end

  private

    def files(path, filename)
      files = Dir.glob glob_string(path, filename)
      files.find_all do |p|
        p =~ /\.(#{extensions.join("|")})$/
      end
    end
  end
end
