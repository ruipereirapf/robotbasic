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
    
    Given I am on the amazon home page
    When I access menu "Eletrônicos"
    Then page title should be "Eletrônicos e Tecnologia | Amazon.com.br"
    And the text "Eletrônicos e Tecnologia" must be in the page
    And the category "Computadores e Informática" must be in the page


Test Case 02 - Product Search
    [Documentation]    This tests verifys the search of a product
    [Tags]             product_search search_list

    Given I am on the amazon home page
    When I search for the product "Xbox Series S"
    Then the page title should be "Amazon.com.br : Xbox Series S"
    And one product from the "Xbox Series S" must be in the page


Test Case 03 - Add product to cart
    [Documentation]    This test verifys if a product as been added to the shopping cart
    [Tags]             add_cart

    Given I am on the amazon home page
    When I add to the product "Console Xbox Series S" to the cart
    Then Then the product "Console Xbox Series S" must be in shown in the cart

Test Case 04 - Remove product from cart
    [Documentation]    This test Verifys if a product is removed from the cart
    [Tags]             remove_cart

    Given I am on the Amazon home page
    And the product "Console Xbox Series S" is on the cart
    When I remove the product "Console Xbox Series S" from the cart
    Then Then cart should be empty