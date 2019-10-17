*** Settings ***

Resource     ../Resources/Projectkeyword.robot
Suite Setup     Open the Browser and load the site Disovery.com    ${LOGIN URL}   ${BROWSER}
Suite teardown    Close all browsers


*** Test Cases ***
Scroll Down to Popular Shows
    Scroll down and serach for popular shows

Click on Explore the show
    Click on Explore the shows at the show end

Create a new file and write all the show title and duration
    Create a csv file and store the required information