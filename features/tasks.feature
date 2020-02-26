Feature: Task

	Scenario: Create Task Succesfully
			Given I go to "task/new"
			When I POST the following data to "tasks":
				| task[name]	| task[priority]	| task[description] |
				| Task1			| High				| This is task1		|
			Then The following task exists:
				| name	| description	| priority	| done	|
				| Task1	| This is task1	| High		| False |
