require 'rubygems'
require 'bundler/setup'

require 'stencil'
require "tilt"

RSpec.configure do |config|
  # some (optional) config here
  Stencil::Config.paths << "./spec/fixtures"
end
