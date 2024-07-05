# shopping_app

A Shopping App

## Getting Started

This is a simple shopping app built using Flutter. The app displays a list of products and allows users to add and remove items from the checkout cart. It also provides a checkout screen where users can view their selected items, see the subtotal, and place an order.

## Features

1. Product List: Displays a static list of products.
2. Add to Cart: Allows users to add items to the checkout cart.
3. Remove from Cart: Allows users to remove items from the checkout cart.
4. Checkout Screen: Displays items in the cart, shows the subtotal, and allows users to place an order.
5. Order Successful Screen: Displays a confirmation message when an order is placed.

## Project Structure

lib/

├── main.dart

├── models/

│   ├── cart_item.dart

│   └── product.dart

├── pages/

│   ├── checkout_page.dart

│   ├── main_page.dart

│   ├── order_successful_page.dart

│   ├── products_page.dart

│   └── splashscreen.dart

├── components/

│   └── toolbar.dart

├── config/

│   └── app_strings.dart

├── styles/

│   ├── app_color.dart

│   └── app_text.dart

└── widgets/

|   ├── big_text.dart
    
|   ├── checkout_item.dart
    
|   ├── icon_and_taxt_widget.dart
    
|   ├── product_item.dart
    
|   └── small_text.dart

## Usage

**Product List Screen**
1. Displays a list of products with their names and prices.
2. Users can increment or decrement the quantity of each product.

**Checkout Screen**
1. Displays the items added to the cart.
2. Shows the total quantity and price for each item.
3. Displays the subtotal of all items.
4. Users can place an order by clicking the "Place Order" button, which will navigate to the Order Successful screen.

**Order Successful Screen**
1. Displays a confirmation message when an order is successfully placed.
2. Users can navigate back to the product list screen.

## Screenshots

![Screenshot_20240705-165739](https://github.com/segedev/shopping_app/assets/69418057/993a6dea-7369-4e34-83bd-f3e0cac63e6d)

![Screenshot_20240705-165747](https://github.com/segedev/shopping_app/assets/69418057/8057d431-8133-4087-b2ba-dc681ef92f14)

![Screenshot_20240705-165809](https://github.com/segedev/shopping_app/assets/69418057/ffacb64a-4704-4c99-b54d-08c6f543e3bb)

![Screenshot_20240705-165816](https://github.com/segedev/shopping_app/assets/69418057/609d18e4-7e56-4e83-aaf9-0798c1ab1132)


## Thank you
