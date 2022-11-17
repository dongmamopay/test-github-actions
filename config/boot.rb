# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

$env = ENV['APP_ENV'] || 'development'
$root = File.expand_path('..', __dir__)

Bundler.require
Bundler.require($env.to_sym)
Dotenv.load if defined?(Dotenv)

require 'active_support'
require 'active_support/core_ext'

Dir['./config/initializers/**/*.rb'].sort.each(&method(:require))
Dir['./lib/*.rb'].sort.each(&method(:require))
Dir['./lib/**/*.rb'].sort.each(&method(:require))
