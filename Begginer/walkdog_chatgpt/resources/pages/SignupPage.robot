*** Settings ***
Documentation            Arquivo  que representa a página de cadastro com ações e elementos

Library        SeleniumLibrary

*** Keywords ***

Fill out dog walker form
    [Arguments]        ${Fullname}    ${Email}    ${Cpf}   ${Zipcode}    ${AddressNumber}    ${AddressDetails}    ${Document}

    Input Text    css=input[name="name"]               ${FullName}
    Input Text    css=input[name="email"]              ${Email}    
    Input Text    css=input[name="cpf"]                ${Cpf}
    Input Text    css=input[name="cep"]                ${Zipcode}
    Input Text    css=input[name="addressNumber"]      ${AddressNumber}
    Input Text    css=input[name="addressDetails"]     ${AddressDetails}
    Choose File   css=input[type="file"]               ${EXECDIR}/fixtures/${Document}
    

Submit form
    Wait Until Element Is Visible    xpath=//button[contains(text(), "Cadastrar")]    
    Click Element                    xpath=//button[contains(text(), "Cadastrar")]

Popup should have text
    [Arguments]            ${expected_text}

    ${element}            Set Variable        xpath=//div[contains(@class, "swal2-html-container")]

    Wait Until Element Is Visible    xpath=//div[contains(@class, "swal2-html-container")]
    Element Should Be Visible        ${element}
    Element Should Contain           ${element}    ${expected_text}

    
   
