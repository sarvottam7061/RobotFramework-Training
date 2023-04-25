*** Settings ***
Documentation    This is a resource file for SAP flori
Library    SeleniumLibrary

*** Variables ***
${url}    https://3.134.200.189:44300/sap/bc/ui5_ui5/ui2/ushell/shells/abap/FioriLaunchpad.html
${username}    925007
${username_locator}    id:USERNAME_FIELD-inner
${password}    Lerc092!vr
${password_locator}    id:PASSWORD_FIELD-inner
${Browser}  Chrome
${Exec Path}  ../../Drivers/chromedriver.exe
${Login_button_locator}    id:LOGIN_LINK

*** Keywords ***
Open the chrome browser and navigate to SAP Flori URL
    open browser    ${url}    ${Browser}  executable_path=${Exec Path}
    maximize browser window
    click button    id:details-button
    click link    id:proceed-link
Fill the username and password textbox with correct credential
    input text    ${username_locator}    ${username}
    input password    ${password_locator}   ${password}
Click on Log On Button and verify that you successfully logged In
    click button    ${Login_button_locator}
    wait until element is visible    id:sf     30 seconds
Click on Search Icon and input VA01 in the search box and hit search button
    click element    id:sf
    input text    id:searchFieldInShell-input-inner    VA01
#    click element    id:searchFieldInShell-button-img
Select the Create Standard Order VA01 from the list
    sleep   10 seconds
    click element   xpath://*[text()="Create Sales Orders - "]

Navigate to the Selected option that will open in a new tab
    @{windows}    Get Window Handles    CURRENT
#    switch browser      CURRENT
    Sleep    10 seconds
Fill the Create Sales Documents form
    @{form_elements}    Get WebElements    dom:document.class="lsField__inputcontainer"
    ${form_element_length}    get length    ${form_elements}
#    input text    ${form_elements[1]}     OR
#    FOR    ${element}    IN    @{form_elements}
#    Log    ${element.text}
#    END
    input text   {form_elements[1]}    OR
#    input text    xpath://*[text()="Sales Organization"]    1710
#    input text    xpath://*[text()="Distribution Channel"]    10
#    input text    xpath://*[text()="Division"]    00
#    click element    xpath://*[text()="Continue"]
    sleep    10 seconds





Click on Search Icon and input Stock - Single Material in the search box and hit search button
    click element    xpath://*[@id="sf"]
    input text     id:searchFieldInShell-input-inner    Stock - Single Material
    sleep    10 seconds
    wait until element is visible    xpath://*[text()="Single Material"]
    click element    xpath://*[text()="Single Material"]
Enter the material TG11 in the search box of the new page and select TG11
    sleep    10 seconds
    wait until element is visible    id:application-Material-displayStockOverview-component---S1--MaterialInput-inner
    input text     id:application-Material-displayStockOverview-component---S1--MaterialInput-inner   TG11
    click element    xpath://*[text()="Trad.Good 11,PD,Reg.Trading"]
Check both Table vie and Chart view
    click element    xpath://div[@class="sapSuiteUiCommonsChartContainerToolBarArea"]/div/ul/li[1]
    click element    xpath://div[@class="sapSuiteUiCommonsChartContainerToolBarArea"]/div/ul/li[2]
    scroll element into view    xpath://*[text()="Reporting Date 18.04.2023 / Unit of Measure PC"]
Click on Search Icon and input Transfer Stock - Cross-Plant in the search box and hit search button
    click element    xpath://*[@id="sf"]
    input text     id:searchFieldInShell-input-inner    Transfer Stock - Cross-Plant
    sleep    5 seconds
    wait until element is visible    xpath://*[text()="Cross-Plant"]
    click element    xpath://*[text()="Cross-Plant"]
Enter the material TG11 in the Cross_Plant search box of the new page and select TG11
    sleep    10 seconds
    wait until element is visible    id:application-Material-transferStockCrossPlant-component---S1--idMaterialInput-inner
    input text    id:application-Material-transferStockCrossPlant-component---S1--idMaterialInput-inner    TG11
    click element    xpath://*[text()="Trad.Good 11,PD,Reg.Trading"]
Note down the stocks available now and Click on the icon from which you want to send stocks and then Click on the icon into which you want to receive stocks
    wait until element is visible    id:application-Material-transferStockCrossPlant-component---S1--idStockChart-chart-item-0-value
    ${Unrestricted_Use_Stock}    get text    id:application-Material-transferStockCrossPlant-component---S1--idStockChart-chart-item-0-value
    log to console    ${Unrestricted_Use_Stock}











#    click element    xpath://table[@id="application-Material-transferStockCrossPlant-component---S1--idPlantStorageLocationTable-listUl"]/tbody/tr[2]/td[3]/div/button/span
#    click element    xpath://table[@id="application-Material-transferStockCrossPlant-component---S1--idPlantStorageLocationTable-listUl"]/tbody/tr[3]/td[3]/div/button/span
#Now Enter the quantity to be transferred and Click Post
#    wait until element is visible    id:idInputQuantity-input-inner
#    input text    id:idInputQuantity-input-inner    100
#    click element    id:idPostButton-BDI-content


