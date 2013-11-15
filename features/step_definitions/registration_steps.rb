
Then(/^the result should be "(.*?)" on the screen$/) do |arg1|
  @session.should have_content(arg1)
end

Then(/^The pie percentages should be "(.*?)" and "(.*?)"$/) do |arg1, arg2|
  sleep(5)
  p1 = @session.find(:css, ".highcharts-data-labels > g:nth-child(1) > text:nth-child(1) > tspan:nth-child(1)").text()
  p2 = @session.find(:css, ".highcharts-data-labels > g:nth-child(2) > text:nth-child(1) > tspan:nth-child(1)").text()
  containsPercentages = ( p1 == arg1 || p1 == arg2 ) && ( p2 == arg1 || p2 == arg2 )
  containsPercentages.should == true
end

Given(/^I fill today for "(.*?)"$/) do |field|
  @session.fill_in(field.gsub(' ', '_'), :with => DateTime.now)
end
