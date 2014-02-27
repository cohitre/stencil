module Stencil
  class MissingNeedError < StandardError; end

  class Base
    include HtmlHelpers
    class << self
      def needs(*keys)
        @keys ||= []
        @keys.concat keys.map(&:to_s)
        @keys
      end

      # Public: allows you to set optional fields + defaults for a Stencil.
      #
      # Usage:
      #   optional size: 20  # @size defaults to 20
      #
      #   optional start_time: -> { Time.now }  # start_time is evaluated at
      #                                         # template creation time
      #
      #   optional size: 20, color: 'xxl' # multiple values
      def optional(options = nil)
        @optional ||= {}
        @optional.merge!(options) unless options.nil?
        @optional
      end

      def assert_keys(keys)
        needs.each do |key|
          if !keys.map(&:to_s).include?(key)
            raise MissingNeedError, "Required value \"#{key}\" not included"
          end
        end
      end

      def template(name)
        @template_name = name
      end

      def template_file
        finder = Stencil::Config.default_template_finder
        @template_file ||= finder.find(@template_name)
      end
    end

    def initialize(options={})
      options = options_with_defaults(options)

      options.each_pair do |k, v|
        self.instance_variable_set "@#{k}", v
      end

      self.class.assert_keys(options.keys)
    end

    def template
      @template ||= Tilt.new(self.class.template_file)
    end

    def to_html
      self.template.render(self)
    end

    alias :render :to_html

  private

    def options_with_defaults(options)
      optional_fields_with_transformations.merge(options)
    end

    # We want to compute any optional lambdas here, as well as
    # clone any Strings/Hashes/Arrays from their defaults.
    def optional_fields_with_transformations
      transformed = {}

      self.class.optional.each_pair do |key, value|
        case value
        when Hash, Array, String
          transformed[key] = value.clone
        when Proc
          transformed[key] = value.call
        else
          transformed[key] = value
        end
      end

      transformed
    end
  end
end
