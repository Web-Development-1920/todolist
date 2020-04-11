Feature: Auth System and Users implementation

  Background:
    Given I create a "user" with the following data:
      | name      | surname       | username | email | encrypted_password |
      | User1  | Surname1  | username1 | email1@gmail.com | $2a$11$1JiMwaCtcAWxMQysohNvhOobkY.7j39nxnMlU4HqYfovWyk0neNhC |

  # AUTH SYSTEM

  Scenario: Sing in with an existing user
    Given I go to "/users/sign_in"

    When I fill "user_email" with "email1@gmail.com"
    And I fill "user_password" with "secret"
    And I click on "Log in"
    Then I see "fdfs"
    Then  I am on "/"
    And I see "Sign Out"
#    And I have a session

  Scenario: Sing out with an existing session
    Given I sing in with "email1@gmail.com"
    And I go to "/users/sign_out"

    Then  I am on "/"
    And I see "Sign In"
    And I see "Sign Up"

#    And I do not have a session

  Scenario: Check user can access to restricted areas
    Given I sing in with "email1@gmail.com"
#    And I have a session

    When  I go to "/projects"
    Then  I am on "/projects"
    And I go to "/tasks"
    Then  I am on "/tasks"

  Scenario: Check guest can not access to restricted areas
#    Given I do not have a session

    When  I go to "/projects"
    Then  I am on "/"
    And I go to "/tasks"
    Then  I am on "/"


  # Register new User
  Scenario: Register user successfully
    Given I go to "/users/sign_up"

    When I fill "user[name]" with "User2"
    And I fill "user[surname]" with "Surname2"
    And I fill "user[username]" with "username1"
    And I fill "user[email]" with "email2@gmail.com"
    And I fill "user[password]" with "secret"
    And I click on "Sing Up"
    Then I am on "/"
    And The following "user" exists:
      | name      | surname       | username | email |
      | User2  | Surname2  | username2 | email2@gmail.com |
    And I see "Sing Out"


  ## Read User

  Scenario: Read One Existing User
    Given I go to "/users/1"

    Then I see "User1"
    * I see "Surname1"
    * I see "email1@gmail.com"
    * I see "username1"


  ## Update user

  Scenario: Update One Existing User
    Given I go to "/users/1/edit"

    When I fill "user[name]" with "User2 edit"
    And I fill "user[surname]" with "Surname2 edit"
    And I fill "user[username]" with "username1 edit"
    And I fill "user[email]" with "email2@gmail.com"
    And I fill "user[password]" with "secret"
    And I click on "Update"
    Then I am on "/users/1"
    And The following "user" exists:
      | name      | surname       | username | email |
      | User2 edit  | Surname2 edit  | username2 edit | email2@gmail.com |

  ## Delete

  Scenario: Delete One Existing User
    Given I go to "/users/1"

    When I click on "Delete"
    And I click on "Yes"
    Then There is not "user" with "id" equal "1"
