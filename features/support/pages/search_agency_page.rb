# Maps the Serch Agency page
class SearchAgencyPage

  include PageObject

  page_url @@url +'/busca-de-agencia'

  text_field	:cep,	id: 'refCep'
  button     :btn_search,  xpatch: '//*[@id="BuscaAgenProximaForm"]/ul[3]/li[2]/a'
  text_field :first_result, xpatch: '//*[@id="ResBuscaAgen"]/div[1]/p'  
  text_field :msg_field_state_is_blank, xpatch: ''  

  def initialize_page
    wait_until(20, 'ERROR: Search Agency page not loaded') do
      cep_element.visible? || btn_search_element.visible?
    end
  end

  def type_cep |cep_agency|
    cep = cep_agency
    btn_search
    end

    def searchAgencySuccess
    btn_search
    wait_until(20, 'ERROR: Result of Search Agency not loaded') do
      first_result_element.visible?
    end

     def searchAgencyFail
    btn_search
    wait_until(20, 'ERROR: Message of blank field not showed') do
      msg_field_state_is_blank_element.visible?
    end
   
  end
end
