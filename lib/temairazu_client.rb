# frozen_string_literal: true

require 'httparty'

Dir[File.join(__dir__, 'temairazu_client/**/*.rb')].sort.each { |file| require_relative file }
