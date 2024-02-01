*** Settings ***
Documentation        Ações, steps e elementos da funcionalidade

Library               Browser

*** Keywords ***
Accessing the registration form
    #go to é uma palavra reservada para acessar uma determinada página na internet
    Click          css=a[href="/signup"]
    #that´s a checkpoint
    Wait For Elements State    form h1    visible    5000
    Get Text                   form h1        equal        Faça seu cadastro

Filling out the address information
    [Arguments]         ${dog_walker}
    Fill Text           css=input[placeholder="Nome completo"]            ${dog_walker}[name]
    Fill Text           css=input[placeholder="E-mail"]                   ${dog_walker}[email]
    Fill Text           css=input[placeholder="CPF somente números"]      ${dog_walker}[cpf]
    Fill Text           css=input[placeholder="CEP"]                      ${dog_walker}[zipcode]
    Fill Text           css=input[placeholder="Número"]                   ${dog_walker}[addressNumber]
    Fill Text           css=input[placeholder="Complemento"]              ${dog_walker}[addressDetails]
    Click               css=input[value="Buscar CEP"]

Validating address information
    #O barra .. redireciona o click para o elemento pai
    [Arguments]         ${dog_walker}   
    Get Property        css=input[name="addressStreet"]        value    equal    ${dog_walker}[street]
    Get Property        css=input[name="addressDistrict"]      value    equal    ${dog_walker}[addressDistrict]
    Get Property        css=input[name="addressCityUf"]        value    equal    ${dog_walker}[addressCityUf]

Additional Service
    [Arguments]       ${additional_service}
    
    Click              xpath=//span[text()="${additional_service}"]/..
    
Upload driver licence
    [Arguments]                    ${dog_walker}
    Upload File By Selector        css=input[type="file"]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]
     
Submit form
    Click                          css=.button-register
    
Popup should be
    [Arguments]                    ${expected_text}
    Wait For Elements State        css=.swal2-html-container    visible      5  
    Get Text                       css=.swal2-html-container    equal        ${expected_text}
Alert should be
    [Arguments]        ${expected_text}
    Wait For Elements State        css=.alert-error >> text=${expected_text}
    ...        visible        5