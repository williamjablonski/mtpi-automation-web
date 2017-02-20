# Maps the Agency page
class AgencyPage

  include PageObject

  page_url @@url +'/pessoa-fisica/santander/atendimento/nas-agencias'

  link			:link_no_brasil,	xpatch: '//*[@id="_W022_Information_Detail_WAR_W022_Information_Detailportlet_INSTANCE_u98EMNP4RZgT__VIEW"]/div/article/div[2]/div/div/p/a' 

  def verify_its_agency_page
    wait_until(20, 'ERROR: Agency page not loaded') do
      link_element.visible?
    end
  end

  def click_no_brasil
    user_signin
  end
end
