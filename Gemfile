source 'https://rubygems.org'

group :development, :test do
	gem 'rake'
	gem 'rspec' 
	gem 'rexical'
	gem 'racc'
	gem 'byebug'
	gem 'guard-rspec'	  ,:require => false
	gem 'guard-bundler'	,:require => false
	gem 'ruby_gntp'
	gem 'wannabe_bool'
	gem 'bogus'
end

gem 'hiera'
if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

