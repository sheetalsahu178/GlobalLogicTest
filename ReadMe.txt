Library Required:

1.robotframework==3.1.2
2.robotframework-selenium2library==1.8.0
3.robotframework-seleniumlibrary==4.0.0
4. selenium==3.141.0

use pip install commant to install the library.[Can create virtual enevironment]


Setting environment variable:

1. ChromeDriver Path
2. FolderStructure Path

Need to set PATH for chrome driver. [It will change the dependending on the OS you were working,Below steps is written for mac o/s.]


Steps:
1. vi ~/.bash_profile
2. Update path variable to locate chrome webdriver.
3. Add FOUNDATIONHOME new variable -> it will donote where the project is running.

export PATH=/usr/local/bin/:$PATH:<specify the local path where chrome driver is present>
export FOUNDATIONHOME=/Users/sheetalsahu/IdeaProjects/GlobalTest/



Note: To get chrome driver, refer below site. Download the version based on the chrome version running local on your system.
https://chromedriver.chromium.org/downloads

3. source ~/.bash_profile



To run the test suite, go to config folder run below command.

python GlobalTestConfig.py


