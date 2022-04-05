# frozen_string_literal: true

require_relative 'lib/avant_utils/version'

Gem::Specification.new do |spec|
  spec.name        = 'avant_utils'
  spec.version     = AvantUtils::Version::STRING
  spec.summary     = 'Avant Utils'
  spec.description = 'Códigos utilizados em projetos Ruby on Rails da Avant Sistemas.'
  spec.authors     = ['Lucas Repolês']
  spec.email       = ['lucas@repoles.com']
  spec.files       = Dir['lib/**/*'] + %w[LICENSE.md README.md]
  spec.homepage    = 'https://rubygems.org/gems/avant_utils'
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 2.7'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.add_development_dependency 'activemodel', '>= 5.2'
end
