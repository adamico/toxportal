Feature: Saisie des dossier
  En tant que transmetteur de dossier de toxicologie
  Je veux pouvoir saisir des dossier dans la base

  Background:
    Given I am logged in as transmitter

  Scenario:
    When I add a new dossier
    Then I should see the added dossier in the list
