# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zipcodeapi/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'zipcodeapi'
  s.version     = ZipCodeApi::VERSION.dup
  s.date        = '2015-07-13'
  s.summary     = "ZipCodeApi"
  s.description = "ZipCodeApi"
  s.authors     = ["KarwanK"]
  s.email       = 'karwank@users.noreply.github.com'
  s.files       = ["lib/zipcodeapi.rb"]
  s.homepage    = 'https://github.com/karwank/zipcodeapi'
  s.license     = 'MIT'
  s.add_runtime_dependency('faraday', ['>= 0.7', '< 0.10'])
  s.add_runtime_dependency('faraday_middleware', ['>= 0.8', '< 0.10'])
  s.add_runtime_dependency('multi_json', '>= 1.0.3', '~> 1.0')
end