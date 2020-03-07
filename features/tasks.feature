Feature: Task

	Background:
		Given I create a "task" with the following data:
			| name | description | priority | done |
			| Task1 | This is task1 | High  | False |

	## Create

	Scenario: Create Task Succesfully
		Given I go to "/tasks/new"

		When I fill "task[name]" with "Task2"
		And I fill "task[description]" with "This is task2"
		And I choose "High" from "task[priority]" selection
		And I click on "Save"
		Then I am on "/tasks/2"
		And The following "task" exists:
			| name | description | priority | done |
			| Task2 | This is task2 | High  | False |


	Scenario: Create Task Failure
		Given I go to "/tasks/new"

		When I click on "Save"
		Then I am on "/tasks/new"
		And I see "Error message"
		And There is not "task" with "id" equal "1"


	## Read Task

	Scenario: Read One Existing Task
		Given I go to "/tasks/1"

		Then I see "Task1"
		* I see "This is task1"
		* I see "High"
		* I see "No"

	Scenario: Read All Tasks
		Given I create a "task" with the following data:
			| name | description | priority | done |
			| Task2 | This is task2 | High  | False |
		And I create a "task" with the following data:
			| name | description | priority | done |
			| Task3 | This is task3 | High  | False |
		And I create a "task" with the following data:
			| name | description | priority | done |
			| Task4 | This is task4 | High  | False |
		And I go to "/tasks"

		Then I see "Task1"
		* I see "Task2"
		* I see "Task3"
		* I see "Task4"


	## Update Task

	Scenario: Update One Existing Task
		Given I go to "/tasks/1/edit"

		When I fill "task[name]" with "Task1 edit"
		And I fill "task[description]" with "This is task1 edit"
		And I choose "High" from "task[priority]" selection
		And I click on "Update"
		Then I am on "/tasks/1"
		And The following "task" exists:
			| name | description | priority | done |
			| Task1 edit | This is task1 edit | High  | False |

	## Delete

	Scenario: Delete One Existing Task
		Given I go to "/tasks/1"

		When I click on "Delete"
		And I click on "Yes"
		Then There is not "task" with "id" equal "1"
