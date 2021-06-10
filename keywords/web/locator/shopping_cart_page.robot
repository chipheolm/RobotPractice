*** Variables ***
&{dictShoppingCartPage}
...    product_name=xpath=//*[@id="lnk-viewProduct-{sku}"]/div/text()
...    product_quantity=css=[class='CartItems__CartItemsContainer-jDoZuM gtvBSj'] [data-product-name = '{prd_name}'] [class='Form__FormInput-vd2hnz-0 fQuEjW']