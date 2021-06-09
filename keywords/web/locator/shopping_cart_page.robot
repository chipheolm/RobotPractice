*** Variables ***
&{dictShoppingCartPage}
...    opt_pay_at_store=id=inf-addPaymentMethodTabHeader-payatstore
...    opt_bank_transfer=css=span[data-testid='inf-viewPaymentMethodTabHeaderOnTitle-payment_service_bank_transfer']
...    lb_bank_name=css=[name='agentsName']
...    lb_payment_channel=css=[data-testid='sel-addPaymentMethodBankTransferOnAgentsChannel']
...    txt_phone=css=input[name='telephone']
...    btn_continue_payment=xpath=//*[@data-testid='continue-button']