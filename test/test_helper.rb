require 'simplecov'
SimpleCov.start
require 'date'
require "minitest"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/pride"


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative '../lib/date_range'
require_relative '../lib/reservation'
require_relative '../lib/reservation_maker'
