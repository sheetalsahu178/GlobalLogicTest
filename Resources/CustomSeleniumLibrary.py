from Selenium2Library import Selenium2Library


class CustomSeleniumLibrary(Selenium2Library):
    def get_webdriver_instance(self):
        return self._current_browser()