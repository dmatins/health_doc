source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.3.0'
gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'faker'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails_sortable'
gem 'activerecord-sortable'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
group :development, :test do
  gem 'byebug', platform: :mri
end
group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'pry'
  gem 'pry-byebug'
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.0.0.alpha3.1'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
gem 'bootstrap_form'
gem 'nested_form'
gem 'font-awesome-rails'
gem 'devise'
gem 'devise_invitable'
gem 'haml-rails'
gem 'high_voltage'
#gem 'mysql2', '~> 0.3.18'
gem 'pundit'
gem "paperclip", "~> 5.0.0"
gem 'paper_trail'
gem 'therubyracer', :platform=>:ruby
gem 'fullcalendar-rails'
gem 'jquery-datatables-rails', '~> 3.4.0'
gem 'momentjs-rails'
group :development do
  gem 'better_errors'
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm', '~> 0.1.1'
  gem 'html2haml'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
  gem 'binding_of_caller'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
