Gem::Specification.new do |s|
  s.name        = 'circulate'
  s.version     = '0.1.1'
  s.summary     = 'Pubsub DSL for ActiveSupport::Notifications'
  s.description = 'Allows any class to be a publisher of or subscriber to a notification'
  s.authors     = ['Chris Stump']
  s.email       = 'chris@tablexi.com'
  s.license     = 'MIT'
  s.homepage    = 'http://rubygems.org/gems/circulate'

  cur_dir = File.expand_path('.', File.dirname(__FILE__))
  s.files = Dir[ File.join(cur_dir, './lib/**/*') ].each {|f| f.gsub!("#{cur_dir}/", '')}

  s.required_ruby_version = '~> 2.0.0'
  s.add_dependency 'i18n'
  s.add_dependency 'activesupport'
  s.add_development_dependency 'rspec-core'
  s.add_development_dependency 'rspec-expectations'
  s.add_development_dependency 'rspec-mocks'
end
