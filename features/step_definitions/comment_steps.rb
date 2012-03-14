When /^I access the dossiers list$/ do
  visit dossiers_path
end

When /^I add a comment to a dossier$/ do
  click_on "Ajouter commentaire"
  fill_in "comment_body", with: "test"
end

Then /^that comment should be visible$/ do
  pending # express the regexp above with the code you wish you had
end
