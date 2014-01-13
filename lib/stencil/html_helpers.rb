module Stencil
  module HtmlHelpers
    def content_tag(tag, content, attributes={})
      %Q[<#{tag}#{html_attributes(attributes)}>#{content}</#{tag}>]
    end

    def html_attributes(attributes)
      if attributes.nil? || attributes == {}
        ""
      else
        str = attributes.map do |k, v|
          if v.is_a? Array
            value = v.join " "
          else
            value = v
          end
          %Q[#{k}="#{value.gsub('"', '&quot;')}"]
        end
        ' ' + str.join(" ")
      end
    end
  end
end
