Feature: Auth System and Users implementation

  Background:
    Given I create a "user" with the following data:
      | name      | surname       | username | email | password | password_confirmation |
      | User1  | Surname1  | username1 | email1@gmail.com | P@ssw0rd | P@ssw0rd             |
    And The following "user" exists:
      | name      | surname       | username | email |
      | User1  | Surname1  | username1 | email1@gmail.com |

  # AUTH SYSTEM

  Scenario: sign in with an existing user
    Given I go to "/users/sign_in"

    When I fill "user[email]" with "email1@gmail.com"
    And I fill "user[password]" with "P@ssw0rd"
    And I click on "Log In"
    Then  I am on "/"
    And I see "Sign Out"

  Scenario: sign out with an existing session
    Given I sign in with "email1@gmail.com"
    And I go to "/users/sign_out"

    Then  I am on "/"
    And I see "Sign In"
    And I see "Sign Up"


  Scenario: Check user can access to restricted areas
    Given I sign in with "email1@gmail.com"

    When  I go to "/projects"
    Then  I am on "/projects"
    And I go to "/tasks"
    Then  I am on "/tasks"

  Scenario: Check guest can not access to restricted areas
#    Given I do not have a session

    When  I go to "/projects"
    Then  I am on "/users/sign_in"
    And I go to "/tasks"
    Then  I am on "/users/sign_in"


  # Register new User
  Scenario: Register user successfully
    Given I go to "/users/sign_up"

    When I fill "user[name]" with "User2"
    And I fill "user[surname]" with "Surname2"
    And I fill "user[username]" with "username2"
    And I fill "user[email]" with "email2@gmail.com"
    And I fill "user[password]" with "P@ssw0rd"
    And I click on "Sign Up!"
    Then I am on "/"
    And I see "Sign Out"
    And The following "user" exists:
      | name      | surname       | username | email |
      | User2  | Surname2  | username2 | email2@gmail.com |


  ## Read User

#  Scenario: Read One Existing User
#    Given I sign in with "email1@gmail.com"
#    Given I go to "/users/1"
#
#    Then I see "User1"
#    * I see "Surname1"
#    * I see "email1@gmail.com"
#    * I see "username1"
#
#
#  ## Update user
#
#  Scenario: Update One Existing User
#    Given I sign in with "email1@gmail.com"
#    Given I go to "/users/edit"
#
#    When I fill "user[name]" with "User2 edit"
#    And I fill "user[surname]" with "Surname2 edit"
#    And I fill "user[username]" with "username1 edit"
#    And I fill "user[email]" with "email2@gmail.com"
#    And I fill "user[password]" with "secret"
#    And I click on "Update"
#    Then I am on "/users/1"
#    And The following "user" exists:
#      | name      | surname       | username | email |
#      | User2 edit  | Surname2 edit  | username2 edit | email2@gmail.com |
#
#  ## Delete
#
#  Scenario: Delete One Existing User
#    Given I sign in with "email1@gmail.com"
#    Given I go to "/users/1"
#
#    When I click on "Delete"
#    And I click on "Yes"
#    Then There is not "user" with "id" equal "1"
