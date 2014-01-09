# Stencil

Stencil is a small framework to generate very reusable and testable views. Each
stencil class has its own methods and template file. It's inspired by
[Erector](https://github.com/erector/erector) to allow for inheritance and
encapsulation without losing the convenience of template files.

## Installation

Add this line to your application's Gemfile:

    gem 'stencil'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stencil

## Usage

## Example

```ruby
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
```

```erb
# app/stencils/user_information_stencil.html.erb
<div class="user <%= "user-big" if big? %>">
  <strong><%= name %></strong>
</div>
```

```ruby
# some_other_file.ruby

stencil = UserInformationStencil.new(user: @user)
stencil.size = :big
stencil.render
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
