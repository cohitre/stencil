# Stencil

An easy way to create reusable widgets.

## Installation

Add this line to your application's Gemfile:

    gem 'stencil'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stencil

## Usage

    class UserInformationStencil < Stencil::Base
      template_file "app/stencils/user_information_stencil.html.erb"
      attr_writer :size

      def big?
        @size == :big
      end
    end

    stencil = UserInformationStencil.new
    stencil.size = :big
    stencil.render

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
