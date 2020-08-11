# ---------------------
# Create steps from each step within the Gherkin scenario
# ---------------------

require_relative '../../../Env/main'

Given(/^I am viewing the concert archive$/) do
  @main.go('https://www.theconcertarchive.com/')
end

When(/^I enter 'chemical brothers'$/) do
  @main.search_box.wait_until(&:present?).click
  @main.sendkeys('chemical brothers')
  @main.enter
  sleep 2
end

Then(/^I can view those results$/) do
  result = @main.title_act.text
  raise(StandardError, 'Check search results are working') unless result == 'THE CHEMICAL BROTHERS'
end