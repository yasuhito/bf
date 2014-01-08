# -*- coding: utf-8 -*-

When /^I close the stdin stream$/ do
  @interactive.stdin.close
end

When(/^I type:$/) do |string|
  step %Q{I type "#{string}"}
end
