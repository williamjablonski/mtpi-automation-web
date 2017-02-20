

Feature: As an user, I want search for bank places arround of me

  @Search-agency-sucess
  Scenario Outline: Search bank places arround of me
    Given I am on home page
    And I click at agency button
    Then I should be redirected to agency page
    And I click in click aqui at 'No Brasil'
    And I put the CEP as <nu_CEP>
    And I click at Search button
    Then the data of agency is showed

    Examples:
    | nu_CEP   | 
    | 04664020 |  
    | 06414025 |  
	| 66613911 |
	| 01107901 |
	| 40010904 |

  @Search-agency-fail
  Scenario Outline: Search bank places arround of me
    Given I am on home page
    And I click at agency button
    Then I should be redirected to agency page
    And I click in click aqui at 'No Brasil'
    And I click at Search button
    Then the message "Por favor, preencha o estado" is showed
