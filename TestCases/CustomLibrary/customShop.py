from robot.api.deco import library, keyword


# Library SeleniumLibrary
@library
class customShop:

    # def __init__(self):

    @keyword
    def hello_world(self):
        print("Hello!, this my my first custom Keyword using python")

