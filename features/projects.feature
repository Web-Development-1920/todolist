Feature: Projects

  Background:
    Given I create a "project" with the following data:
      | name      | description       |
      | Project1  | This is project1  |
    And I create a "task" with the following data:
      | name  | description   | priority  | done  | project_id  |
      | Task1 | This is task1 | 1         | False | 1           |
    And I create a "task" with the following data:
      | name  | description   | priority  | done | project_id   |
      | Task2 | This is task2 | 3         | True | 1            |
    And I create a "task" with the following data:
      | name  | description   | priority  | done  |
      | Task3 | This is task3 | 1         | False |

	## Create

  Scenario: Create Project Succesfully
    Given I go to "/projects/new"

    When I fill "project[name]" with "Project2"
    And I fill "project[description]" with "This is project2"
    And I choose "Task3" from "project[tasks]" selection
    And I click on "Create"
    Then I am on "/projects/2"
    And The following "project" exists:
      | name | description |
      | Project2 | This is project2 |
    And The following "task" exists:
      | name  | project_id |
      | Task3 | 2          |

  Scenario: Create Project Failure
    Given I go to "/projects/new"

    When I click on "Create"
    Then I am on "/projects"
    And I see "error prohibited this project from being created"
    And There is not "project" with "id" equal "2"


	## Read Project

  Scenario: Read One Existing Project
    Given I go to "/projects/1"

    Then I see "Project1"
    * I see "This is project1"
    * I see "Task1"
    * I see "Task2"

  Scenario: Read All Projects
    Given I create a "project" with the following data:
      | name | description |
      | Project2 | This is project2 |
    And I create a "project" with the following data:
      | name | description |
      | Project3 | This is project3 |
    And I create a "project" with the following data:
      | name | description |
      | Project4 | This is project4 |

    And I go to "/projects"

    Then I see "Project1"
    * I see "Project2"
    * I see "Project3"
    * I see "Project4"


	## Update Project

  Scenario: Update One Existing Project
    Given I go to "/projects/1/edit"

    When I fill "project[name]" with "Project1 edit"
    And I fill "project[description]" with "This is project1 edit"
    And I choose "Task3" from "project[tasks]" selection
    And I click on "Update"
    Then I am on "/projects/1"
    And The following "project" exists:
      | name | description |
      | Project1 edit | This is project1 edit |
    And The following "task" exists:
      | name  | project_id |
      | Task3 | 1          |


	## Delete

  Scenario: Delete One Existing Project
    Given I go to "/projects/1"

    When I click on "Delete"
    And I click on "Yes"
    Then There is not "project" with "id" equal "1"
