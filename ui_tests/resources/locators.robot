*** Variables ***
${BASE_URL}          https://www.saucedemo.com/
${USERNAME_FIELD}    css:input[data-test="username"]
${PASSWORD_FIELD}    css:input[data-test="password"]
${LOGIN_BUTTON}      css:input[data-test="login-button"]
${PRODUCT_NAME}      xpath://div[@class='inventory_item_name']
${ADD_TO_CART_BUTTON}    xpath://button[contains(@data-test, 'add-to-cart-')]
${CART_ICON}         id:shopping_cart_container
${CART_ITEMS}        xpath://div[@class='cart_item']
${CHECKOUT_BUTTON}   id:checkout
${FIRST_NAME_FIELD}    id:first-name
${LAST_NAME_FIELD}     id:last-name
${POSTAL_CODE_FIELD}   id:postal-code
${FINISH_BUTTON}     id:finish
${CONTINUE_BUTTON}    id:continue

${ORDER_CONFIRMATION}    xpath://h2[text()="Thank you for your order!"]
