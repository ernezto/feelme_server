
Then(/^the result should be "(.*?)" on the screen$/) do |arg1|
  @session.should have_content(arg1)
end

Then(/^The "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  p @session.has_content?('QUITO')
  result = @session.find(:css, 'g.highcharts-data-labels.highcharts-tracker')
  p result
end
