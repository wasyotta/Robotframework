*** Settings ***
Documentation        Suite de testes da home page

Library        Browser

*** Test Cases ***
Home page deve estar online
    New Browser        browser=firefox       headless=False
    New page    https://walkdog.vercel.app/
    Get Text    h1    equal    Cuidado e diversão em cada passo

    Click    strong    Quero ser Dog Walker

    Take Screenshot