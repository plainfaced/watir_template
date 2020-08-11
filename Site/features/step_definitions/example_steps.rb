# ---------------------
# Create steps from each step within the Gherkin scenario
# ---------------------

require_relative '../../../Env/main'

Given(/^I am viewing google$/) do
  @main.go('https://www.google.com/')
end

When(/^I enter "([^"]*)"$/) do |arg|
  @main.search_box.wait_until(&:present?).click
  @main.sendkeys(arg)
  @main.enter
  sleep 2
end

Then(/^my site will be listed$/) do
  result = @main.include('This Is Benjamin Upton')
  raise(StandardError, 'Check search results are working') unless result
end