source 'https://rubygems.org'

# This line requires >= bundler-1.2
ruby "1.9.3"

gem 'bundler',
    '~> 1.2.0.rc'                       # gem install bundler --pre
gem 'rails', '~> 3.2'

gem 'pg'
gem 'devise', git: 'git://github.com/plataformatec/devise.git', branch: 'master'
gem "omniauth-facebook"
gem "omniauth-twitter"
gem "omniauth-google"

gem 'sass-rails',     '~> 3.2.3'
gem 'haml-rails'
gem 'bootstrap-sass', '~> 2.0.4.0'
gem 'coffee-rails',   '~> 3.2.1'
gem 'uglifier',       '>= 1.0.3'

gem 'jquery-rails'
gem 'kaminari'
gem 'jbuilder'

### controller utilities
gem 'decent_exposure'

group :development do
  gem 'annotate',                       # database documention in model files
      :require => false                 #   usage: 'annotate --exclude tests,fixtures'
  gem 'rails-erd'                       # generate ERD docs via: 'rake erd'
end
