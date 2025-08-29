# frozen_string_literal: true

require 'httparty'
require 'ox'

Dir[File.join(__dir__, 'temairazu_client/**/*.rb')].sort.each { |file| require_relative file }
