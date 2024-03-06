*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    http://www.amazon.com.br
${MENU_ELETRONICOS}       //a[@data-csa-c-slot-id='nav_cs_7']
${HEADER_ELETRONICOS}     //h1[contains(.,'Eletrônicos e Tecnologia')]
${SEARCH_BAR}             //input[contains(@type,'text')]
${SEARCH_ICON}            //span[@aria-label='Ir']
${ADD_CART}               //input[contains(@name,'submit.add-to-cart')]
${CART}                   //a[@class='nav-a nav-a-2 nav-progressive-attribute']

*** Keywords ***

Abrir_Browser
    Open Browser    browser=chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar_Browser
    Capture Page Screenshot
    Close Browser

Access amazon home page
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}    timeout=10

Enter menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verify if phrase "${PHRASE}" appears
    Wait Until Page Contains    text=${PHRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verify if page title is "${TITLE}"
    Title Should Be    title=${TITLE}

Verify if category "${CATEGORY_NAME}" appears
    Element Should Be Visible    locator=//a[@aria-label='${CATEGORY_NAME}']

Write product name "${PRODUCT_NAME}" in search bar
    Input Text    locator=${SEARCH_BAR}    text=${PRODUCT_NAME}

Click search button
    Click Element    locator=${SEARCH_ICON}

Verify if searched result is listing searched product "${PRODUCT_NAME}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUCT_NAME}')])[3]

Add product "${PRODUCT_NAME}" to cart
    Click Element    locator=(//span[contains(.,'${PRODUCT_NAME}')])[3]
    Wait Until Element Is Visible    locator=${ADD_CART}
    Click Element    locator=${ADD_CART}

Verify if product "${PRODUCT_NAME}" has been added
    Wait Until Element Is Visible    locator=${CART}
    Click Element    locator=${CART}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUCT_NAME}')]

Remove product "${PRODUCT_NAME}" from cart
    Click Element    locator=//input[@aria-label='Excluir ${PRODUCT_NAME}']

Verify if shopping cart is empty
    Wait Until Element Is Visible    locator=${CART}
    Click Element    locator=${CART}
    Wait Until Page Contains Element    locator=//h2[contains(.,'Seu carrinho da Amazon está vazio')]


#                                 GHERKIN STEPS




Given I am on the Amazon home page
    Access amazon home page
    Verify if page title is "Amazon.com.br | Tudo pra você, de A a Z."

When I access menu "Eletrônicos"
    Enter menu "Eletrônicos"

Then page title should be "Eletrônicos e Tecnologia | Amazon.com.br"
    Verify if page title is "Eletrônicos e Tecnologia | Amazon.com.br"

And the text "Eletrônicos e Tecnologia" must be in the page
    Verify if phrase "Eletrônicos e Tecnologia" appears

And the category "Computadores e Informática" must be in the page
    Verify if category "Computadores e Informática" appears
    
When I search for the product "Xbox Series S"
    Write product name "Xbox Series S" in search bar
    Click search button

Then the page title should be "Amazon.com.br : Xbox Series S"
    Verify if page title is "Amazon.com.br : Xbox Series S"

And one product from the "Xbox Series S" must be in the page
    Verify if searched result is listing searched product "Console Xbox Series S"

When I add to the product "Console Xbox Series S" to the cart
    Write product name "Xbox Series S" in search bar
    Click search button
    Verify if searched result is listing searched product "Console Xbox Series S"
    Add product "Console Xbox Series S" to cart

Then the product "Console Xbox Series S" must be in shown in the cart
    Verify if product "Console Xbox Series S" has been added

And the product "Console Xbox Series S" is on the cart
    Write product name "Xbox Series S" in search bar
    Click search button
    Verify if searched result is listing searched product "Console Xbox Series S"
    Add product "Console Xbox Series S" to cart
    Verify if product "Console Xbox Series S" has been added

When I remove the product "Console Xbox Series S" from the cart
    Remove product "Console Xbox Series S" from cart

Then cart should be empty
    Verify if shopping cart is empty