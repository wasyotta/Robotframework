*** Settings ***

Resource        ${EXECDIR}/resources/base.resource


Test Setup          Start session
Test Teardown       Finish session

*** Test Cases ***

Register a Dog Walker successfully

   Fill out dog walker form       Wilson Alves Silva        testeqa@teste.com       00000041414        06505070        447        B    cnhfake.png
   Submit form          
   Popup should have text          Recebemos o seu cadastro e em breve retornaremos o contato.
     


