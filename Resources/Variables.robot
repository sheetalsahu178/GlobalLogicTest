*** Variables ***

${LOGIN URL}    https://go.discovery.com/
${xpathshowtab}  //*[@id=\"react-root\"]/div/div[1]/div[2]/header/div[2]/div/nav/ul/li[2]/span
${xpathshowallshows}  //div[@id='show-drop-desktop']/ul[1]/li[11]/div[@class='dscShowsDropContent__seeAllShowsContainer' and 1]/a[@class='dscShowsDropContent__seeAllShows' and 1]
${BROWSER}      Chrome
${allshowsurl}     https://go.discovery.com/tv-shows/
${apolloxpath}      //*[@id=\"react-root\"]/div/div[1]/main/section/div/div[2]/div[30]/div/a/div/img
${xpathmyvideosmenu}    //li[@class='dscHeaderMain__hideMobile']
${xpathmyvideo}         //*[@id="react-root"]/div/div[1]/div[2]/header/nav/div[2]/div/div/div[2]/div[2]/ul/li[4]/a
${xpathpopularshows}   //*[@id=\"react-root\"]/div/div[1]/section[9]/div/div[1]/h2