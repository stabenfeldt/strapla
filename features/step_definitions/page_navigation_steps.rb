Given(/^I am signed in$/) do
  email = 'testing@man.net'
  password = 'secretpass'
  Fabricate(:user, email: email, password: password, password_confirmation: password)

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Given(/^We have one expert user in our database$/) do
  Fabricate(:user)
end

When(/^I go to the frontpage$/) do
  visit '/'
end



Given(/^I am on the home page$/) do
  visit('/')
end

When(/^I (?:follow|click|press) "(.*?)"$/) do |name|
  click_on name
end


#When(/^I visit the frontpage$/) do
#  pending # express the regexp above with the code you wish you had
#end
#
#When(/^I click New requests sent to you$/) do
#  pending # express the regexp above with the code you wish you had
#end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |field, data|
  fill_in field, with: data
end

#Then(/^"(.*?)" should receive an email with the text "(.*?)"$/) do |arg1, arg2|
#  pending # express the regexp above with the code you wish you had
#end

#Then(/^"(.*?)" clicks the link "(.*?)"$/) do |arg1, arg2|
#  pending # express the regexp above with the code you wish you had
#end
#
#Then(/^$/) do
#  pending # express the regexp above with the code you wish you had
#end
#
#Given(/^I have a the expert "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
#  pending # express the regexp above with the code you wish you had
#end
#
#When(/^I fill in and submit the request form$/) do
#  pending # express the regexp above with the code you wish you had
#end
#
#
#When(/^I go to the home page$/) do
#  visit('/')
#end
#
#Then(/^I should not see "(.*?)"$/) do |arg1|
#  pending # express the regexp above with the code you wish you had
#end
#
#Then(/^I open the page$/) do
#  save_and_open_page
#end
