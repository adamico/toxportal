Feature: Commentaires
  En tant qu'utilisateur de l'appli toxportal
  Je veux pouvoir rajouter des commentaires aux dossiers

  Background:
    Given I am logged in as transmitter
    And an existing dossier

  @javascript
  Scenario: Add a comment to a dossier
    When I access the dossier
    And I add a comment
    Then that comment should be visible
