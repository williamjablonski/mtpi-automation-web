#Search Agency Success

Given(/^I am on home page$/) do
  visit(HomePage)
end

Given(/^And I click at agency button$/) do
  on(HomePage).click_menu_agency
end

Given(/^Then I should be redirected to agency page$/) do
  on(AgencyPage).verify_its_agency_page
end

Given(/^And I click in click aqui at \'No Brasil\'$/) do
  on(AgencyPage).click_no_brasil
end

Given(/^And I put the CEP as "([^"]*)"$/) do |nu_CEP|
  on(SearchAgencyPage).type_cep(nu_CEP)
end

Given(/^And I click at Search button$/) do
  on(SearchAgencyPage).searchAgencySuccess
end

Then(/^Then the data of agency is showed$/) do
  expect(on(SearchAgencyPage).first_result_element.visible?).to be_truthy
end

#Search Agency Fail

Given(/^Then the message \"Por favor, preencha o estado\" is showed$/) do
	WebDriverWait wait = new WebDriverWait(@driver, 18);
	wait.until(ExpectedConditions.alertIsPresent());
    # expect(on(SearchAgencyPage).msg_field_state_is_blank_element.visible?).to be_truthy
end