#encoding: utf-8
### UTILITY METHODS ###
def valid_user
  @user ||= { :name => "Testy McUserton", :email => "testy@userton.com",
    :password => "please", :password_confirmation => "please"}
end

def sign_up user
  Factory(:user,
    name: user[:name],
    email: user[:email],
    password: user[:password],
    password_confirmation: user[:password_confirmation]
  )
end

def sign_in user
  visit '/users/sign_in'
  fill_in "Email", :with => user[:email]
  fill_in "Password", :with => user[:password]
  click_button "Connexion"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  sign_up valid_user
end

Given /^I exist as a user$/ do
  sign_up valid_user
  visit '/users/sign_out'
end

Given /^I do not exist as a user$/ do
  User.find(:first, :conditions => { :email => valid_user[:email] }).should be_nil
  visit '/users/sign_out'
end

### WHEN ###
When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with valid credentials$/ do
  sign_in valid_user
end

When /^I sign in with a wrong password$/ do
  user = valid_user.merge(:password => "wrongpass")
  sign_in user
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Déconnectez-vous"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Connexion"
  page.should_not have_content "Déconnectez-vous"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Vous devez vous connecter ou vous inscrire pour continuer."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Identifiant ou mot de passe incorrect."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Connecté."
end
