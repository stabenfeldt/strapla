Then(/^I select "(.+)" as the technology I want the this application build in\.$/) do |title|
  page.select(title, :from => 'request_request_group_id')
end

Given(/^I have completed the first part of the wizard$/) do
  steps %{
    When I go to the frontpage
    Then I press "Get someone to help you"
    When I press "Build something new"
    And I select "Ruby on Rails" as the technology I want the this application build in.
    And I fill in all the mandatory fields with the necessary background information.
    And I press "Save"
  }
  @background_information = BackgroundInformation.last
  @background_information.should be_valid
  @request = Request.last
end

Given(/^I am on the page where I can add new features$/) do
  current_path.should eq new_request_feature_path(@request)
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

Then(/^I fill in the New feature form$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^this data to fill the background information form:$/) do |table|
  @table = table.raw
end

Then(/^I fill in all the mandatory fields with the necessary background information\.$/) do
  @table.each do |data|
    fill_in data.first, :with => data.last
  end
end

Given(/^We have the expert group named (.+)/) do |title| 
  Fabricate(:request_group, title: title)
  RequestGroup.last.title.should eq title
end


Then(/^I fill in the first New feature form$/) do
  within(:css, '.feature1') do
    fill_in 'Title', with: 'Post requests for help'
    fill_in 'Text', with: 'Post requests for help'
  end
end

Then(/^I fill in the second New feature form$/) do
  within(:css, '.feature2') do
    fill_in 'Title', with: 'Post requests for help'
    fill_in 'Text', with: 'Post requests for help'
  end
end

Given(/^I have created two features and pressed Next$/) do
  Feature.all.size.should eq 2
end

Then(/^we should have a new request available for consultants to give a price quote on\.$/) do
  Request.last.should be_valid
  Request.last.title.should eq 'Post request for help'
end


Then(/^I should have (\d+) features stored in the database$/) do |n|
  pending "works in production"
  Feature.all.size.should eq n
end


Then(/^we should have one BackgroundInformation object saved$/) do
  BackgroundInformation.all.size.should eq 1
end

Given(/^We have one expert user in our database, named (.+)/) do |name|
  Fabricate(:user, name: name)
end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |field, data|
  fill_in field, with: data
end

Then(/^I select "(.*?)" as the group$/) do |arg1|
  select arg1
end

Then(/^I should see at least one expert$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the user named Paul should have been delegated the request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have created two features$/) do
  steps %{
    Given I have completed the first part of the wizard
    Then I should see "Describe which features you want"
    Then I fill in the first New feature form
    And I fill in the second New feature form
    When I press "Next"
    Then I should have 2 features stored in the database
  }
end
