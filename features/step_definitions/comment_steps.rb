Then /^show me the page$/ do
  save_and_open_page
end

Given /^an existing dossier$/ do
  steps %{
    When I add a new dossier
  }
end

When /^I access the dossier list$/ do
  visit dossiers_path
end

When /^I add a comment for the dossier$/ do
  click_on "Commentaires (0)"
  fill_in "comment_body", with: "test"
  click_on "Enregistrer"
end

Then /^that comment should be visible$/ do
  page.should have_content("test")
end
