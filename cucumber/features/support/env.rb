
require 'capybara'
require 'capybara/cucumber'
require 'rspec'


Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :driver_path=>"/home/student/Downloads/chromedriver")
end

Capybara.default_driver = :chrome
