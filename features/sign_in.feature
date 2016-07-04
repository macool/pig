Feature: Sign in
  As a user with sign in credentials
  In order to manage content on the site
  The CMS should allow me to sign in

Scenario: Sign in with correct details
  Given an author exists with email "author@yoomee.com" and password "password"
  When I visit the sign in page
  And I complete the form with email "author@yoomee.com" and password "password"
  Then I should be redirected to the dashboard

Scenario: Sign in with incorrect details
  Given an author exists with email "author@yoomee.com" and password "password"
  When I visit the sign in page
  And I complete the form with email "foo@bar.com" and password "drowssap"
  Then I should be redirected to the sign in page
  And I should see an "Invalid Email or password" message

Scenario: Request password reset
  Given an author exists with email "author@yoomee.com"
  When I visit the sign in page
  And I click the forgotten password link
  And I complete the forgotten password form with email "author@yoomee.com"
  Then I should receive an email with password reset instructions

Scenario: Password reset
  Given an author exists with email "author@yoomee.com"
  And I have requested a password reset
  When I follow the reset link in the instructions
  And I choose a new password
  Then I should be redirected to the dashboard

