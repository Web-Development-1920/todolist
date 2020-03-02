Feature: Task

	Scenario: Create Task Succesfully
		Given I go to "task/new"

		When I fill "task[name]" with "Task1"
		And I choose "High" from "task[priority]" selection
		And I fill "task[description]" with "This is task1"
		And I click on "Save"
		Then I am on "task/1"
		And The following "task" exists:
			| name | description | priority | done |
			| Task1 | This is task1 | High  | False |


	Scenario: Create Task Failure
		Given I go to "task/new"

		When I click on "Save"
		Then I am on "task/new"
		And I see "Error message"
		And There is not "task" with "id" equal "1"