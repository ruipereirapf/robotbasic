*** Settings ***
Documentation    This suite tests webwise amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir_Browser
Test Teardown    Fechar_Browser

*** Test Cases ***

Test Case 01 - Access menu "Eletrônicos"
    [Documentation]    This test verifys if the menu 'Eletrônicos' exist at amazon.com.br
    ...                and verifys the category 'Computadores e Informática'
    [Tags]             menus category
    
    Access amazon home page
    Verify if page title is "Amazon.com.br | Tudo pra você, de A a Z."
    Enter menu "Eletrônicos"
    Verify if phrase "Eletrônicos e Tecnologia" appears
    Verify if page title is "Eletrônicos e Tecnologia | Amazon.com.br"
    Verify if category "Computadores e Informática" appears
    Verify if category "Tablets" appears

Test Case 02 - Product Search
    [Documentation]    This tests verifys the search of a product
    [Tags]             product_search search_list

    Access amazon home page
    Write product name "Xbox Series S" in search bar
    Click search button
    Verify if searched result is listing searched product "Console Xbox Series S"

Test Case 03 - Add product to cart
    [Documentation]    This test verifys if a product as been added to the shopping cart
    [Tags]             add_cart

    Access amazon home page
    Write product name "Xbox Series S" in search bar
    Click search button
    Verify if searched result is listing searched product "Console Xbox Series S"
    Add product "Console Xbox Series S" to cart
    Verify if product "Console Xbox Series S" has been added

Test Case 04 - Remove product from cart
    [Documentation]    This test Verifys if a product is removed from the cart
    [Tags]             remove_cart

    Access amazon home page
    Write product name "Xbox Series S" in search bar
    Click search button
    Verify if searched result is listing searched product "Console Xbox Series S"
    Add product "Console Xbox Series S" to cart
    Verify if product "Console Xbox Series S" has been added
    Remove product "Console Xbox Series S" from cart
    Verify if shopping cart is empty