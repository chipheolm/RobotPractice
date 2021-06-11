*** Variables ***
&{dictSearchingPage}
...    screen_size_group=css=div[title="Screen Size Group (inches)"] * div[class='Checkbox-dODbyV kzpWEi']
...    screen_size_opt=css=div[title='{titile_name}']
...    lbl_size_option=//div[contains(@class,'Padding') and text() = '{size_inch} ${lang_unit}' ]
...    opt_size_option=//div[contains(@class,'Padding') and text() = '{size_inch} ${lang_unit}' ]//parent::div[contains(@class,'Col__Column')]//parent::div[contains(@class,'Row__Wrapper')]/div[1]/div[contains(@class,'Checkbox')]
...    opt_number_product=//div[contains(@class,'Padding') and text() = '{size_inch} ${lang_unit}' ]/div/span
...    target_product=css=div[data-productid='{sku}']
...    target_product_name=css=div[data-productid='{sku}'] a:last-child span