
Then(/^the result should be "(.*?)" on the screen$/) do |arg1|
  @session.should have_content(arg1)
end

Then(/^The "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  @session.has_content?(arg2)
end
