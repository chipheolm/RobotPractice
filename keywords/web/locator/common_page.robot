*** Variables ***
&{dictCommonPage}
...    entire_page=xpath=//body
...    popup_iframe=css=body > div.sp-fancybox-wrap.sp-fancybox-wrap-2168.sp-advanced-css-2168.adaptive-resolution.adaptive-position.adaptive-x-position-center.adaptive-y-position-middle > iframe
...    search_input_box=xpath=//header/div[2]/div[1]/div[1]/div[1]/div[1]/input[1]
...    search_button=xpath=//header/div[2]/div[1]/div[1]/div[1]/div[1]/button[1]
...    search_result_text=css=h1[class='Text-sc-9p67zt-0 dLudwb']
...    shopping_cart_number=css=div [class='MiniCart__CartQty-bJioin bNCDDv'] span
...    shopping_cart_icon=css=div[class='MainHeader__MiniCartContainer-cOzool KbPez'] a[id=btn-openMiniCart]