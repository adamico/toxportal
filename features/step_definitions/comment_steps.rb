Then /^show me the page$/ do
  save_and_open_page
end

Given /^an existing dossier$/ do
  steps %{
    When I add a new dossier
  }
end

When /^I access the dossier$/ do
  visit dossier_path(Dossier.first)
end

When /^I add a comment$/ do

  fill_in "comment_body", with: "test"
  click_on "Enregistrer"
end

Then /^that comment should be visible$/ do
  page.should have_content("test")
end
