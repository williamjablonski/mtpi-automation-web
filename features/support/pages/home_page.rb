# Maps the home page
class HomePage

  include PageObject

  page_url @@url

  div :menu_agencias, xpatch: '//*[@id="_W016_Links_Cluster_Grouper_WAR_W016_Links_Cluster_Grouperportlet_INSTANCE_5aBBL1oFimft__VIEW"]/article/nav/div[1]/div[1]/nav/ul/li[3]/a'

  def initialize_page
    wait_until(20, 'ERROR: Home page not loaded') do
      menu_agencias_element.visible?
    end
  end

  def click_menu_agency
    menu_agencias
  end


end
