require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am on (.+)$/ do |page_name|
  Capybara.app_host = 'http://0.0.0.0:4000'
  @session = Capybara::Session.new(:selenium)
  @session.visit path_to(page_name)
  sleep(2)
  puts page.html
end

When /^I go to (.+)$/ do |page_name|
  @session.visit path_to(page_name)
end

When /^I press "([^\"]*)"$/ do |button|
  #click_button(button)
  @session.find_button(button).click
end

When /^I click "([^\"]*)"$/ do |link|
  @session.click_link(link)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  @session.fill_in(field.gsub(' ', '_'), :with => value)
end

When /^I fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  @session.fill_in(field.gsub(' ', '_'), :with => value)
end
