Given("I go to {string}") do |newTask_url|
	get newTask_url
	assert_response :success
end

When("I POST the following data to {string}:") do |post_url, table|
	# table is a Cucumber::MultilineArgument::DataTable
	post post_url, params:table
	assert_response :redirect
	follow_redirect!
	assert_response :success
end
  
Then("The following task exists:") do |table|
	# table is a Cucumber::MultilineArgument::DataTable
	assert (Task.where(table))
end