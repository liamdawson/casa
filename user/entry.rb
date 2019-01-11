#!/usr/bin/env ruby

# frozen_string_literal: true

$current_os = Gem::Platform.local.os.to_sym

partials = Dir["#{__dir__}/config/???-*.rb"]

partials.each do |partial|
  require partial
end
