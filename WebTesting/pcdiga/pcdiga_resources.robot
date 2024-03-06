*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                chrome
${URL}                    https://www.pcdiga.com/
${MENU_TV}                //div[@class='flex flex-col gap-2 justify-center group'][contains(.,'Televisores')]
${HEADER_TV}              //div[@class='mt-3'][contains(.,'Televisores')]
${PRODUCT_DIV}            //div[@class='flex flex-col bg-background-off p-1.5 md:p-3 rounded-r4'][contains(.,'Consola Microsoft Xbox Series S 1TB Carbon BlackUma consola de nova geração. Jogos de nova geração. Embarca em novas aventuras tal como foram concebidas para serem vividas.XXU-00009Em stock - Entrega prevista 02 de Fevereiro349,90 €CompararFavoritos')]
${ADD_CART}               //button[contains(.,'ADICIONAR')]
${CHECK_CART}             //button[@class='ga-header-cart relative cursor-pointer'][contains(.,'1')]
${BUY}                    //button[@class='flex-grow'][contains(.,'FINALIZAR COMPRA')]
${COOKIES}                //button[@class='ch2-btn ch2-allow-all-btn ch2-btn-primary'][contains(.,'Permitir')]
${CLOSE_CART}             //div[@class='p-2 hover:text-border-color duration-200 cursor-pointer inline-block absolute right-4 top-4']

*** Keywords ***
Abrir Browser
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar Browser
    Capture Page Screenshot
    Close Browser

Access home page pcdiga.com
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_TV}

Accept Cookies
    Click Element    locator=${COOKIES}

Enter the menu "Televisores"
    Click Element    locator=${MENU_TV}

Verify if appears phrase "${TEXT}"
    Wait Until Page Contains    text=${TEXT}
    Wait Until Element Is Visible    locator=${HEADER_TV}

Verify if page title is "${TITLE}"
    Title Should Be    title=${TITLE}

Write product name "${PRODUCT_NAME}"
    Input Text    locator=searchbar    text=${PRODUCT_NAME}

Check the search results to see if the searched product is listed "${PRODUCT_NAME}"
    Wait Until Element Is Visible    locator=//h1[@class='page_title font-bold relative pl-2.5 text-2xl'][contains(.,'Resultados da pesquisa: ${PRODUCT_NAME}')]

Click on product
    Wait Until Element Is Visible    locator=//span[contains(.,'Consola Microsoft Xbox Series S 1TB Carbon Black')]
    Click Element    locator=//a[contains(.,'Consola Microsoft Xbox Series S 1TB Carbon Black')]

Add product to cart
    Wait Until Element Is Visible    locator=${ADD_CART}
    Click Element    locator=${ADD_CART}

Close Cart
    Wait Until Element Is Visible    locator=${CLOSE_CART}
    Click Element    locator=${CLOSE_CART}

Verify cart content
    Click Element    locator=${CHECK_CART}
    Wait Until Element Is Visible    locator=${BUY}
    