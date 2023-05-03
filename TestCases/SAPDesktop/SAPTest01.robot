*** Settings ***
Documentation    this is a test scenario for SAP testing
Library           SapGuiLibrary
Library           Process
Library           variables.py
*** Variables ***


*** Test Cases ***
To Validate Create Standard Order: Overview VA01
    Start SAPApplication
    Fill the credentials and click on OK
    Fill Create Sales Document Form and Continue
    Fill Create Standard Order Form and Continue
    Fill Display Order Details Form and Continue
    Verify Document Completion
    Save and Get Order Number



*** Keywords ***
Start SAPApplication
  Start Process  C://Program Files (x86)//SAP//FrontEnd//SAPgui//saplogon.exe
  Sleep    5
  Connect To Session
  Open Connection  SQT
Fill the credentials and click on OK
    Input Text  /app/con[0]/ses[0]/wnd[0]/usr/txtRSYST-BNAME      925007
    Input Password  /app/con[0]/ses[0]/wnd[0]/usr/pwdRSYST-BCODE   Lerc092!vr
    Click Element   /app/con[0]/ses[0]/wnd[0]/tbar[0]/btn[0]

Fill Create Sales Document Form and Continue
    Run Transaction  VA01
    Click Element   /app/con[0]/ses[0]/wnd[0]/tbar[0]/btn[0]
    Input Text  /app/con[0]/ses[0]/wnd[0]/usr/ctxtVBAK-AUART  OR
    Input Text  /app/con[0]/ses[0]/wnd[0]/usr/ctxtVBAK-VKORG  1710
    Input Text  /app/con[0]/ses[0]/wnd[0]/usr/ctxtVBAK-VTWEG  10
    Input Text  /app/con[0]/ses[0]/wnd[0]/usr/ctxtVBAK-SPART  00
    Click Element    /app/con[0]/ses[0]/wnd[0]/tbar[0]/btn[0]

Fill Create Standard Order Form and Continue
    Input Text    /app/con[0]/ses[0]/wnd[0]/usr/subSUBSCREEN_HEADER:SAPMV45A:4021/subPART-SUB:SAPMV45A:4701/ctxtKUAGV-KUNNR  17100008
    Input Text    /app/con[0]/ses[0]/wnd[0]/usr/subSUBSCREEN_HEADER:SAPMV45A:4021/subPART-SUB:SAPMV45A:4701/ctxtKUWEV-KUNNR  17100008
    Input Text    /app/con[0]/ses[0]/wnd[0]/usr/subSUBSCREEN_HEADER:SAPMV45A:4021/txtVBKD-BSTKD                              test_015
    Click Element    /app/con[0]/ses[0]/wnd[0]/tbar[0]/btn[0]
    Input Material
    Input Order Quantity
    Input Plant
    Click Element    /app/con[0]/ses[0]/wnd[0]/tbar[0]/btn[0]
    Click Element    /app/con[0]/ses[0]/wnd[0]/tbar[1]/btn[18]

Fill Display Order Details Form and Continue
    Click Element  /app/con[0]/ses[0]/wnd[0]/usr/subSUBSCREEN_HEADER:SAPMV45A:4021/btnBT_HEAD
    Click Order Data
    Input Purchase Order Type
    Click Element    /app/con[0]/ses[0]/wnd[0]/tbar[0]/btn[0]
    Click Sales
    Select Order Reason
    Click Element    /app/con[0]/ses[0]/wnd[0]/mbar/menu[1]
    Click Element   /app/con[0]/ses[0]/wnd[0]/mbar/menu[1]/menu[11]

Verify Document Completion
#    Element Value Should Contain  /app/con[0]/ses[0]/wnd[0]/sbar/pane[0]   Document is complete
    ${text}  Get Value    /app/con[0]/ses[0]/wnd[0]/sbar/pane[0]
    Log   ${text}

Save and Get Order Number
    Click Element  /app/con[0]/ses[0]/wnd[0]/tbar[0]/btn[11]
    ${order}  Get Value    /app/con[0]/ses[0]/wnd[0]/sbar/pane[0]
    Log    ${order}




