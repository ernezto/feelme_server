
Then(/^the result should be "(.*?)" on the screen$/) do |arg1|
  page.should have_content(arg1)
end
