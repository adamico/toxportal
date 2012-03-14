Feature: Commentaires
  En tant qu'utilisateur de l'appli toxportal
  Je veux pouvoir rajouter des commentaires aux dossiers

  Background:
    Given I am logged in as transmitter

  Scenario: Add a comment to a dossier
    When I access the dossiers list
    And I add a comment to a dossier
    Then that comment should be visible

  Scenario: Access comments list

  Scenario: Modify a comment
