*** Setting ***
Resource    ${CURDIR}/../../resources/imports.robot
Resource    ${CURDIR}/page/searching_page.robot
Resource    ${CURDIR}/page/shopping_cart_page.robot
Resource    ${CURDIR}/common/common_keywords.robot
Resource    ${CURDIR}/../api/api_cart.robot

Variables   ${CURDIR}/../../resources/language/${language}.yaml
*** Keywords ***
Global init
    Set Global Variable    ${language}    ${language.lower()}