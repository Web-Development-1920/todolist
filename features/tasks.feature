Feature: Tasks

	Background:
		Given I create a "task" with the following data:
			| name | description | priority | done |
			| Task1 | This is task1 | 1  | False |
		And I create a "user" with the following data:
			| name      | surname       | username | email | encrypted_password |
			| User1  | Surname1  | username1 | email1@gmail.com | $2a$11$1JiMwaCtcAWxMQysohNvhOobkY.7j39nxnMlU4HqYfovWyk0neNhC |
		And I sing in with "email1@gmail.com"
#		And I have a session

	## Create

	Scenario: Create Task Succesfully
		Given I go to "/tasks/new"

		When I fill "task[name]" with "Task2"
		And I fill "task[description]" with "This is task2"
		And I choose "High" from "task[priority]" selection
		And I click on "Create"
		Then I am on "/tasks/2"
		And The following "task" exists:
			| name | description | priority | done |
			| Task2 | This is task2 | 1  | False |


	Scenario: Create Task Failure
		Given I go to "/tasks/new"

		When I click on "Create"
		Then I am on "/tasks"
		And I see "error prohibited this task from being saved"
		And There is not "task" with "id" equal "2"


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
			| Task2 | This is task2 | 1  | False |
		And I create a "task" with the following data:
			| name | description | priority | done |
			| Task3 | This is task3 | 1  | False |
		And I create a "task" with the following data:
			| name | description | priority | done |
			| Task4 | This is task4 | 1  | False |
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
			| Task1 edit | This is task1 edit | 1  | False |

	## Delete

	Scenario: Delete One Existing Task
		Given I go to "/tasks/1"

		When I click on "Delete"
		And I click on "Yes"
		Then There is not "task" with "id" equal "1"
