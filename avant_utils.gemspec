require_relative 'lib/avant_utils/version'

Gem::Specification.new do |spec|
  spec.name        = 'avant_utils'
  spec.version     = AvantUtils::Version::STRING
  spec.date        = '2020-08-13'
  spec.summary     = 'Avant Utils'
  spec.description = 'Códigos utilizados em projetos Ruby on Rails da Avant Sistemas.'
  spec.authors     = ['Lucas Repolês']
  spec.email       = ['repoles@gmail.com']
  spec.files       = Dir['lib/**/*'] + %w[LICENSE.md README.md]
  spec.homepage    = 'https://rubygems.org/gems/avant_utils'
  spec.license     = 'MIT'

  spec.add_development_dependency 'actionpack', '~> 6.0'
  spec.add_development_dependency 'activerecord', '~> 6.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
end
