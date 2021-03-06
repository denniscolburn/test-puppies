Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
end

When(/^I click the View Details button$/) do
  @browser.button(:value => 'View Details').click
end

And(/^I click the Adopt Me button$/) do
  @browser.button(:value => 'Adopt Me!').click
end

And(/^I click the Complete the Adoption button$/) do
  @browser.button(:value => 'Complete the Adoption').click
end

And(/^I enter "([^"]*)" in the name field$/) do |name|
  @browser.text_field(:id => 'order_name').set(name)
end

And(/^I enter "([^"]*)" in the address field$/) do |address|
  @browser.text_field(:id => 'order_address').set(address)
end

And(/^I enter "([^"]*)" in the email field$/) do |email|
  @browser.text_field(:id => 'order_email').set(email)
end

And(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  @browser.select_list(:id => 'order_pay_type').select(pay_type)
end

And(/^I click the Place Order button$/) do
  @browser.button(:value => 'Place Order').click
end

Then(/^I should see "([^"]*)"$/) do |expected|
  expect(@browser.text).to include expected
end

When(/^I click the first View Details button$/) do
  @browser.button(:value => 'View Details', :index => 0).click
end

And(/^I click the Adopt Another Puppy button$/) do
  @browser.button(:value => 'Adopt Another Puppy').click
end

And(/^I click the second View Details button$/) do
  @browser.button(:value => 'View Details', :index => 1).click
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |pet_name, line_item_number|
  row = (line_item_number.to_i - 1) * 6
  expect(@browser.table(:index => 0)[row][1].text).to include pet_name
end

And(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item_number|
  row = (line_item_number.to_i - 1) * 6
  expect(@browser.table(:index => 0)[row][3].text).to include subtotal
end

And(/^I should see "([^"]*)" as the cart total$/) do |cart_total|
  expect(@browser.td(:class => 'total_cell').text).to eq cart_total
end