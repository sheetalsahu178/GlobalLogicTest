*** Settings ***

#Library     RequestsLibrary
#Library     Collections
#Library     OperatingSystem
#Resource    ../Resources/Variables.robot
#Library     SSHLibrary
##Library     ../Library/SQL.py
#Library      ../Library/SSH.py
Resource     ../Resources/Variables.robot
#Library         Selenium2Library
Library       ../Resources/MyLibrary.py
Library       ../Resources/CustomSeleniumLibrary.py




*** Keywords ***
Open the Browser and load the site Disovery.com
    [Arguments]     ${LOGIN URL}   ${BROWSER}
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window


Click on show tab from menu and select the see all shows options
    Click Element    xpath=${xpathshowtab}
#    Click Element    xpath=id('show-drop-desktop')/li[text()='See All Shows']
#    ${content}  Get Element Attribute   xpath=${xpathshowallshows}
    ${item}=	Set Variable
    Open Browser    ${allshowsurl}   ${BROWSER}
    Maximize Browser Window


Load the page and Select the shows having name as Apollo
    Execute JavaScript    window.scrollTo(0,3000)
    Execute JavaScript    window.scrollTo(0,3000)
    Wait Until Page Contains Element    xpath=${apolloxpath}    50s
    ${webdriver}=   Get webdriver instance
    Set Suite Variable      ${webdriver}
    @{apollolist}=     Select all the apollo shows     ${webdriver}
    Set Suite Variable      @{apollolist}


Launch the selected apollo sites and add it to favourites if not added
#    log to console      ${apollolist}
    @{favlist}=    Launch the apollo site and add it to fav list   ${apollolist}   ${webdriver}
    Set Suite Variable  @{favlist}


Click on my video from the right corner menu
    Click Element   xpath=${xpathmyvideosmenu}
#    ${element_xpath}=   Set Variable    //*[@id=\"react-root\"]/div/div[1]/div[2]/header/nav/div[2]/div/div/div[2]/div[2]/ul/li[4]/a
#    ${res}=     Get Element Attribute    ${element_xpath}@href
    Click Element   xpath=${xpathmyvideo}
    sleep   10s


Verify the favorite or unfavorite titles under FAVORITE SHOWS section
     @{favshowlist}=    Get the List of shows from favourite section   ${webdriver}
     Compare both the list  ${favshowlist}   @{favlist}


Scroll down and serach for popular shows
    ${webdriver}=   Get webdriver instance
    Set Suite Variable      ${webdriver}
    Execute JavaScript    window.scrollTo(0,3000)
    Execute JavaScript    window.scrollTo(0,3000)
    Click Element       xpath=${xpathpopularshows}
    Click on the last arrow key     ${webdriver}
Click on Explore the shows at the show end
    sleep   10s
    Click on explore the show and click on Show more two times      ${webdriver}

Create a csv file and store the required information
    Get the list of titles and duration     ${webdriver}