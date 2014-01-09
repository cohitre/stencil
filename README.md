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

    # app/stencils/user_information_stencil.rb

    class UserInformationStencil < Stencil::Base
      template "app/stencils/user_information_stencil.html.erb"
      needs :user
      attr_writer :size

      def big?
        @size == :big
      end

      def name
        @user.name
      end
    end

    # app/stencils/user_information_stencil.html.erb
    <div class="user <%= "user-big" if big? %>">
      <strong><%= name %></strong>
    </div>

    # some other file

    stencil = UserInformationStencil.new(user: @user)
    stencil.size = :big
    stencil.render

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
