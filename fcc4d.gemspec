# frozen_string_literal: true

require_relative 'lib/fcc4d/version'

Gem::Specification.new do |s|
  s.name        = 'fcc4d'
  s.version     = FCC4D::VERSION
  s.date        = '2016-10-31'
  s.summary     = "FCC4D API"
  s.description = "FCC4D API wrapper"
  s.authors     = ["Leonid Krinitsyn"]
  s.email       = 'leonid.Krinitsyn@freeconferencecall.com'
  s.files       = ["lib/fcc4d.rb"]
  s.homepage    = 'http://rubygems.org/gems/fcc4d'
  s.license     = 'MIT'

  s.add_dependency('faraday', '~> 2.0')
  s.add_dependency('faraday-net_http_persistent')
  s.add_dependency('net-http-persistent', '>= 3.1')
end
