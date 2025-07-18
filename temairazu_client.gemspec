# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "temairazu_client"
  spec.version       = "0.1.2"
  spec.authors       = [ "Ha Dung" ]
  spec.email         = [ "h-dung@w.metroengines.jp" ]

  spec.summary       = "SC client for Temairazu integration"
  spec.description   = "SOAP-based client to integrate SC/Temairazu with HotelPricing module"
  spec.homepage      = "https://yourdomain.com"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = [ "lib" ]

  spec.add_dependency "httparty"
  spec.add_dependency "nokogiri"
  spec.add_dependency "ox"
  spec.add_dependency "activesupport"
  spec.add_dependency "ahoy_matey"
end
