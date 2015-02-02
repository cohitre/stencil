# Stencil

Stencil is a small framework to generate very reusable and testable views. Each
stencil class has its own methods and template file. It's inspired by
[Erector](https://github.com/erector/erector) to allow for inheritance and
encapsulation without losing the convenience of template files.

## Installation

Add this line to your application's Gemfile:

    gem 'stencil', git: "git://github.com/cohitre/stencil.git"

And then execute:

    $ bundle

## Usage

## Example

```ruby
# app/stencils/user_information_stencil.rb

class UserInformationStencil < Stencil::Base
  template "user_information_stencil"
  needs :user
  optional size: :small

  def big?
    @size == :big
  end

  def small?
    @size == :small
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

```haml
- #user_profile.haml

:ruby
  # initialize your stencil instance
  user_profile = UserInformationStencil.new(user: current_user, size: :big)

= user_profile.render

```

# Rails integration

If you're using Rails, Stencil will look in `app/stencils` for
templates to be used with it (`.erb` or `.haml` files).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
