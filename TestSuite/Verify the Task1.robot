*** Settings ***

Resource            ../Resources/Projectkeyword.robot
Suite Setup     Open the Browser and load the site Disovery.com    ${LOGIN URL}   ${BROWSER}
Suite teardown    Close all browsers



*** Test Cases ***
Click on Shows tab and select See All Shows Option
    Click on show tab from menu and select the see all shows options

Wait for Page load and Select the shows which contain string APOLLO
    Load the page and Select the shows having name as Apollo

Verify the status of the selected shows
    Launch the selected apollo sites and add it to favourites if not added

Click on My Videos from the right top menu and Select the favourite shows section from the page
    Click on my video from the right corner menu

Validate the favourite should show the same list added in previous steps
    Verify the favorite or unfavorite titles under FAVORITE SHOWS section


