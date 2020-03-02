###########################
# Routes
###########################

Given("I go to {string}") do |path|
  visit path
  expect(page.status_code).to be(200)
end

Then("I am on {string}") do |path|
  expect(page).to have_current_path(path)

end


###########################
# Frontend
###########################

When("I fill {string} with {string}") do |input_text, text|
  fill_in input_text, with: text
end

When("I choose {string} from {string} selection") do |choice, input_select|
  select choice, from: input_select
end

When("I click on {string}") do |action|
  click_on action
end

Then("I see {string}") do |text|
  assert_text text
end

###########################
# Database
###########################

Then("There is not {string} with {string} equal {string}") do |name, attribute, value|
  model = name.capitalize.constantize
  query = model.where(attribute => value)
  assert model.empty?
end

Then("The following {string} exists:") do |name, table|
  data = table.raw
  model = name.capitalize.constantize

  query = nil


  for i in data.length
    if query.nil?
      query = model.where(data[0][i] => data[1][i])
    else
      query = query.where(data[0][i] => data[1][i])
    end
  end

  assert query.any?
end