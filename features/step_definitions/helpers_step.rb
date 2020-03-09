class String
  def numeric?
    Float(self) != nil rescue false
  end
end
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
  puts query.to_json
  expect(query.empty?).to be(TRUE)
end

Then("The following {string} exists:") do |name, table|

  model = name.capitalize.constantize

  query = nil
  table.map_headers! { |header| header.downcase }

  data = table.hashes[0]


  data.keys.each do |column|

    if data[column].downcase == "true"
      data[column] = TRUE
    elsif data[column].downcase == "false"
           data[column] = FALSE
    end


    if data[column].to_s.numeric?
      data[column] = data[column].to_i
    end

    if query.nil?
      query = model.where(column => data[column])
    else

      query = query.where(column => data[column])
    end
  end


  expect(query.any?).to be(TRUE)

end

Given("I create a {string} with the following data:") do |name, table|
  # table is a Cucumber::MultilineArgument::DataTable

  table.map_headers! { |header| header.downcase }
  model = name.capitalize.constantize

  data = table.hashes[0]


  data.keys.each do |column|
    if data[column].downcase == "true"
      data[column] = TRUE
    elsif data[column].downcase == "false"
      data[column] = FALSE
    end


    if data[column].to_s.numeric?
      data[column] = data[column].to_i
    end
  end

  model.create(table.hashes)

end
