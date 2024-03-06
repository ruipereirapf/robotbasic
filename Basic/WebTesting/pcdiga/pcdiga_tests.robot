*** Settings ***
Documentation    This suite tests the pcdiga.com website
Resource         pcdiga_resources.robot
Test Setup       Abrir Browser
Test Teardown    Fechar Browser

*** Test Cases ***

# Test Case 01 - Access menu "Televisores"
#     [Documentation]    This test verifys clicking the menu Televisores of the site pcdiga.com
#     ...                If you need more lines of documentation
#     [Tags]             menu    
#     Access home page pcdiga.com
#     Enter the menu "Televisores"
#     Verify if appears phrase "Televisores"
#     Verify if page title is "Televisores | Smart TVs, TVs 4K, TVs Full HD, TVs Led, TVs OLED, TVs QLED e Muito Mais | PCDIGA"


# Test Case 02 - Product Search
#     [Documentation]    This test verifys the search of a product
#     [Tags]             product_search    search_list
#     Access home page pcdiga.com
#     Write product name "corsair scimitar"
#     Check the search results to see if the searched product is listed "corsair scimitar"

Test Case 03 - Add Product to Cart
    [Documentation]    This tests verifys if add a product to the cart is possible
    [Tags]             add_cart
    Access home page pcdiga.com
    Accept Cookies
    Write product name "xbox series s 1tb"
    Check the search results to see if the searched product is listed "xbox series s 1tb"
    Click on product
    Add product to cart
    Close Cart
    Verify cart content
