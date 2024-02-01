*** Settings ***
Documentation        suite de testes de cadastro na dogwalker

Resource             ../resources/base.resource
Test Setup        Start Session
Test Teardown     Finish session

*** Test Cases ***
Deve poder cadastrar um novo dogwalker
    [Tags]        Smoke
    # Test Data
       ${dog_walker}              Create Dictionary
    ...    name=Wilson Alves Silva
    ...    email=willqa@teste.com
    ...    cpf=00000012121
    ...    zipcode=04534011
    ...    street=Rua Joaquim Floriano
    ...    addressNumber=1000
    ...    addressDetails=APTO 28
    ...    addressDistrict=Itaim Bibi           
    ...    addressCityUf=São Paulo/SP
    ...    cnh=toretto.jpg                           

    #Keywords
    Accessing the registration form
    Filling out the address information        ${dog_walker}  
    Validating address information             ${dog_walker}  
    Upload driver licence                      ${dog_walker}  
    Submit form                                
    Popup should be                            Recebemos o seu cadastro e em breve retornaremos o contato.
 


Não deve cadastrar se o cpf for incorreto
    [Tags]        cpf_inv
    # Test Data
       ${dog_walker}              Create Dictionary
    ...    name=Wilson Alves Silva
    ...    email=willqa@teste.com
    ...    cpf=00000012zaa
    ...    zipcode=04534011
    ...    street=Rua Joaquim Floriano
    ...    addressNumber=1000
    ...    addressDetails=APTO 28
    ...    addressDistrict=Itaim Bibi           
    ...    addressCityUf=São Paulo/SP
    ...    cnh=toretto.jpg                           

    #Keywords
    Accessing the registration form
    Filling out the address information        ${dog_walker}  
    Validating address information             ${dog_walker}  
    Upload driver licence                      ${dog_walker}  
    Submit form
     
   ${error_message} =    Get Text    css=.alert-error
    Should Be Equal    ${error_message}    CPF inválido                 

Não deve cadastrar se os todos os campos obrigatótios não forem preechidos
   [Tags]        required        ${expected_text}                

    #Keywords
    Start Session
    Accessing the registration form
    Submit form

   Alert should be    Informe o seu nome completo
   Alert should be    Informe o seu melhor email
   Alert should be    Informe o seu CPF
   Alert should be    Informe um número maior que zero
   Alert should be    Adcione um documento com foto (RG ou CHN)

Deve poder cadastrar um novo dogwalker que sabe cuidar de pets
      [Tags]    acare
      ${dog_walker}              Create Dictionary
    ...    name=Wilson Alves Silva
    ...    email=willqa@teste.com
    ...    cpf=00000012121
    ...    zipcode=04534011
    ...    street=Rua Joaquim Floriano
    ...    addressNumber=1000
    ...    addressDetails=APTO 28
    ...    addressDistrict=Itaim Bibi           
    ...    addressCityUf=São Paulo/SP
    ...    cnh=toretto.jpg                        

    #Keywords
    Accessing the registration form
    Filling out the address information        ${dog_walker}  
    Validating address information             ${dog_walker}
    Additional Service                         Cuidar
    Upload driver licence                      ${dog_walker}  
    Submit form                                
    Popup should be                            Recebemos o seu cadastro e em breve retornaremos o contato.
   
Deve poder cadastrar um novo dogwalker que sabe adestrar pets
      [Tags]    aservice   
      ${dog_walker}              Create Dictionary 
    ...    name=Wilson Alves Silva
    ...    email=willqa@teste.com
    ...    cpf=00000012121
    ...    zipcode=04534011
    ...    street=Rua Joaquim Floriano
    ...    addressNumber=1000
    ...    addressDetails=APTO 28
    ...    addressDistrict=Itaim Bibi           
    ...    addressCityUf=São Paulo/SP
    ...    cnh=toretto.jpg
    
    #Keywords
    Accessing the registration form
    Filling out the address information        ${dog_walker}  
    Validating address information             ${dog_walker} 
    Upload driver licence                      ${dog_walker}  
    Additional Service        Adestrar 
    Submit form                                
    Popup should be                            Recebemos o seu cadastro e em breve retornaremos o contato.