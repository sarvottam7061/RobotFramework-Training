from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class variables:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SapGuiLibrary")

    @keyword
    def input_material(self):
        material = r"/app/con[0]/ses[0]/wnd[0]/usr/tabsTAXI_TABSTRIP_OVERVIEW/tabpT\01/ssubSUBSCREEN_BODY:SAPMV45A:4400/subSUBSCREEN_TC:SAPMV45A:4900/tblSAPMV45ATCTRL_U_ERF_AUFTRAG/ctxtRV45A-MABNR[1,0]"
        self.selLib.input_text(material, "MZ-FG-M550")

    @keyword
    def input_order_quantity(self):
        ordQuant = r"/app/con[0]/ses[0]/wnd[0]/usr/tabsTAXI_TABSTRIP_OVERVIEW/tabpT\01/ssubSUBSCREEN_BODY:SAPMV45A:4400/subSUBSCREEN_TC:SAPMV45A:4900/tblSAPMV45ATCTRL_U_ERF_AUFTRAG/txtRV45A-KWMENG[3,0]"
        self.selLib.input_text(ordQuant, "10")

    @keyword
    def input_plant(self):
        plant = r"/app/con[0]/ses[0]/wnd[0]/usr/tabsTAXI_TABSTRIP_OVERVIEW/tabpT\01/ssubSUBSCREEN_BODY:SAPMV45A:4400/subSUBSCREEN_TC:SAPMV45A:4900/tblSAPMV45ATCTRL_U_ERF_AUFTRAG/ctxtVBAP-WERKS[12,0]"
        self.selLib.input_text(plant, "1710")

    @keyword
    def click_order_data(self):
        data = r"/app/con[0]/ses[0]/wnd[0]/usr/tabsTAXI_TABSTRIP_HEAD/tabpT\11"
        self.selLib.click_element(data)

    @keyword
    def input_purchase_order_type(self):
        type = r"/app/con[0]/ses[0]/wnd[0]/usr/tabsTAXI_TABSTRIP_HEAD/tabpT\11/ssubSUBSCREEN_BODY:SAPMV45A:4351/ctxtVBKD-BSARK"
        self.selLib.input_text(type, "TELE")

    @keyword
    def click_sales(self):
        sale = r"/app/con[0]/ses[0]/wnd[0]/usr/tabsTAXI_TABSTRIP_HEAD/tabpT\01"
        self.selLib.click_element(sale)

    @keyword
    def select_order_reason(self):
        reason = r"/app/con[0]/ses[0]/wnd[0]/usr/tabsTAXI_TABSTRIP_HEAD/tabpT\01/ssubSUBSCREEN_BODY:SAPMV45A:4301/cmbVBAK-AUGRU"
        self.selLib.select_from_list_by_label(reason, "Fast Delivery")


