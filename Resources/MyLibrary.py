from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from time import sleep
import csv
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


def  select_all_the_apollo_shows(driver):
    apollolist=[]
    html_list= driver.find_elements_by_tag_name("a")
    for ele in html_list:
        res= ele.get_attribute("href")
        if str(res).find("apollo") != -1:
            apollolist.append(str(res))

    return apollolist


def launch_the_apollo_site_and_add_it_to_fav_list(apollolist,driver):
    print apollolist
    favlist= []
    for item in apollolist:
        driver.get(item)
        driver.find_element_by_tag_name('body').send_keys(Keys.CONTROL + Keys.HOME)
        sleep(5)
        titname=driver.find_element_by_xpath("//img[@class='showHero__showLogo']").get_attribute("alt")

        ActionChains(driver).move_to_element(driver.find_element_by_xpath("//*[@id=\"react-root\"]/div/div[1]/main/section[1]/div/div[1]/div[2]/div[1]/span/i")).perform()
        tool_tip_elm = WebDriverWait(driver, 50).until(EC.visibility_of_element_located((By.XPATH, "//span[@class='react-tooltip-lite']")))

    # Storing the fav in list
    if tool_tip_elm.text == "Add to My Favorites":
        driver.find_element_by_xpath("//*[@id=\"react-root\"]/div/div[1]/main/section[1]/div/div[1]/div[2]/div[1]/span/i").click()
        favlist.append(titname)
    else:
        print "Show is already added in the Fav list"

    return  favlist


def get_the_list_of_shows_from_favourite_section(driver):
    favshowlist=[]
    html_list= driver.find_elements_by_tag_name("a")
    for ele in html_list:
        res= ele.get_attribute("href")
        if str(res).find("apollo") != -1:
            favshowlist.append(str(res))
    return   favshowlist

def compare_both_the_list(favshowlist,favlist):
    if favshowlist == favlist:
        print ("The lists are identical, Favourite list contains the items got selected at step -3 ")
    else:
        print ("The lists are not same")


def click_on_the_last_arrow_key(driver):
    get_ele= driver.find_element_by_xpath("//*[@id=\"react-root\"]/div/div[1]/section[9]/div/div[1]/div[2]/ul")
    html_list = driver.find_element_by_class_name("popularShowsCarousel__pager")
    items = html_list.find_elements_by_tag_name("li")
    for item in items:
        item.click()

def click_on_explore_the_show_and_click_on_show_more_two_times(driver):
    sleep(10)
    driver.get("https://go.discovery.com/tv-shows/deadliest-catch/")
    sleep(10)
    driver.find_element_by_tag_name('body').send_keys(Keys.CONTROL + Keys.HOME)
    sleep(10)
    driver.find_element_by_class_name("episodeList__showMore").click()
    sleep(10)
    driver.find_element_by_class_name("episodeList__showMore").click()

def get_the_list_of_titles_and_duration(driver):
    html_list = driver.find_element_by_class_name("episodeList__list")
    items = html_list.find_elements_by_tag_name("li")
    outputfile='/Users/sheetalsahu/IdeaProjects/GlobalTest/Testdata/data.csv'
    for item in items:
        with open(outputfile, 'a') as csvFile:
            writer = csv.writer(csvFile)
            writer.writerow([item.text])
