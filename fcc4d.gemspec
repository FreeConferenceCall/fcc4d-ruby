require File.expand_path('../lib/fcc4d/version', __FILE__)

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

  s.add_dependency('faraday', '~>1.0')
end
