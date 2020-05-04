Feature: Projects

  Background:
    Given I create a "user" with the following data:
      | name      | surname       | username | email | password | password_confirmation |
      | User1  | Surname1  | username1 | email1@gmail.com | P@ssw0rd | P@ssw0rd             |
    And I create a "project" with the following data:
      | name      | description       |
      | Project1  | This is project1  |
    And I create a "share" with the following data:
      | user_id      | project_id       |
      | 1            | 1                |
    And I create a "task" with the following data:
      | name  | description   | priority  | done  | project_id  | user_id |
      | Task1 | This is task1 | 1         | False | 1           | 1       |
    And I create a "task" with the following data:
      | name  | description   | priority  | done | project_id   | user_id |
      | Task2 | This is task2 | 3         | True | 1            | 1       |
    And I create a "task" with the following data:
      | name  | description   | priority  | done  | user_id |
      | Task3 | This is task3 | 1         | False | 1       |

    And I sign in with "email1@gmail.com"
#    And I have a session

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
    And The following "share" exists:
      | user_id  | project_id |
      | 1        | 2          |
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
    And I create a "share" with the following data:
      | user_id      | project_id       |
      | 1            | 2                |
    And I create a "project" with the following data:
      | name | description |
      | Project3 | This is project3 |
    And I create a "share" with the following data:
      | user_id      | project_id       |
      | 1            | 3                |
    And I create a "project" with the following data:
      | name | description |
      | Project4 | This is project4 |
    And I create a "share" with the following data:
      | user_id      | project_id       |
      | 1            | 4                |

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


    ########## Notifications & Shares

  Scenario: Share a Project with another user
    Given I create a "user" with the following data:
      | name      | surname       | username | email | password | password_confirmation |
      | User2  | Surname2  | username2 | email2@gmail.com | P@ssw0rd | P@ssw0rd             |
    And I go to "/projects/1"
    And I click on "Share"
    And I choose "username2" from "select_user" selection
    And I click on "Share Project"

    Then I go to "/projects/1"
    And I see "username2"

    And I sign out
    And I sign in with "email2@gmail.com"