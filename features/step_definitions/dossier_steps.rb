When /^I add a new dossier/ do
  visit "/dossiers/new"
  fill_in "Identification", with: "blabla"
  click_on "Enregistrer"
end

Then /^I should see the added dossier in the list$/ do
  page.should have_content "blabla"
end
