import 'package:flutter/material.dart';
import 'package:shopping_app/models/cart_item.dart';
import 'package:shopping_app/pages/checkout_page.dart';
import 'package:shopping_app/pages/products_page.dart';

import '../components/toolbar.dart';
import '../config/app_strings.dart';
import '../models/product.dart';
import '../styles/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final Map<String, CartItem> _checkoutItems = {};
  // final List<Product> _checkoutItems = [];

  static final List<Product> _products = [
    Product(
      id: 'p001', 
      title: 'Pounded Yan & Efo', 
      price: 230, 
      img: 'assets/images/poundedyam.jpg',
      description: 'The best Family Combo😊',
    ),
    Product(
      id: 'p002', 
      title: 'Burger and Fries', 
      price: 295,
      img: 'assets/images/burger.jpg',
      description: 'Get a snack😊',
    ),
    Product(
      id: 'p003', 
      title: 'Pancake and Strawberry', 
      price: 182,
      img: 'assets/images/pancake.jpg',
      description: 'Early Breakfast😊',
    ),
    Product(
      id: 'p004', 
      title: 'Spag', 
      price: 375,
      img: 'assets/images/spag.jpg',
      description: 'Healthy Pasta😊',
    ),
    Product(
      id: 'p005', 
      title: 'Ice-Cream', 
      price: 165,
      img: 'assets/images/icecream.jpg',
      description: 'Cool cream😊',
    ),
    Product(
      id: 'p006', 
      title: 'Lemonade', 
      price: 115,
      img: 'assets/images/drinks.jpg',
      description: 'Freshly Squeezed Lemonade😊',
    ),
    Product(
      id: 'p007', 
      title: 'Sharwarma', 
      price: 297,
      img: 'assets/images/sharwarma.jpg',
      description: 'Hmmmmmm..😊',
    ),
    Product(
      id: 'p008', 
      title: 'Snacks', 
      price: 109,
      img: 'assets/images/snacks.jpg',
      description: 'Yummy😊',
    ),
    Product(
      id: 'p009', 
      title: 'Toast', 
      price: 95,
      img: 'assets/images/toast.jpg',
      description: 'Crunchy Toasts😊',
    ),
  ];

  void _addItemToCheckout(Product product){
    setState(() {
      // _checkoutItems.add(product);
      if(_checkoutItems.containsKey(product.id)){
        _checkoutItems.update(
          product.id,
          (existingItem) => CartItem(
            id: existingItem.id, 
            title: existingItem.title, 
            img: existingItem.img, 
            price: existingItem.price, 
            quantity: existingItem.quantity + 1,
          )
        );
      }
      else {
        _checkoutItems.putIfAbsent(
          product.id,
          () => CartItem(
            id: product.id, 
            title: product.title, 
            img: product.img, 
            price: product.price, 
            quantity: 1,
          )
        );
      }
    });
  }

  void _addItemToCheckoutByCartItem(CartItem cartItem){
    setState(() {
      // _checkoutItems.add(product);
      if(_checkoutItems.containsKey(cartItem.id)){
        _checkoutItems.update(
          cartItem.id,
          (existingItem) => CartItem(
            id: existingItem.id, 
            title: existingItem.title, 
            img: existingItem.img, 
            price: existingItem.price, 
            quantity: existingItem.quantity + 1,
          )
        );
      }
      else {
        _checkoutItems.putIfAbsent(
          cartItem.id,
          () => CartItem(
            id: cartItem.id, 
            title: cartItem.title, 
            img: cartItem.img, 
            price: cartItem.price, 
            quantity: 1,
          )
        );
      }
    });
  }

  void _removeItemFromCheckout(Product product){
    setState(() {
      // _checkoutItems.remove(product);
      if(_checkoutItems.containsKey(product.id) && _checkoutItems[product.id]!.quantity > 1){
        _checkoutItems.update(
          product.id,
          (existingItem) => CartItem(
            id: existingItem.id, 
            title: existingItem.title, 
            img: existingItem.img, 
            price: existingItem.price, 
            quantity: existingItem.quantity - 1,
          )
        );
      }
      else {
        _checkoutItems.remove(product.id);
      }
    });
  }

  void _removeItemFromCheckoutByCartItem(CartItem cartItem){
    setState(() {
      // _checkoutItems.remove(product);
      if(_checkoutItems.containsKey(cartItem.id) && _checkoutItems[cartItem.id]!.quantity > 1){
        _checkoutItems.update(
          cartItem.id,
          (existingItem) => CartItem(
            id: existingItem.id, 
            title: existingItem.title, 
            img: existingItem.img, 
            price: existingItem.price, 
            quantity: existingItem.quantity - 1,
          )
        );
      }
      else {
        _checkoutItems.remove(cartItem.id);
      }
    });
  }

  void _clearCheckout(){
    setState(() {
      _checkoutItems.clear();
    });
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions(BuildContext context, List<Product> products, Map<String, CartItem> checkoutItems, Function addItem, Function addItemByCartItem, Function removeItem, Function removeItemByCartItem, Function clearCheckout) => <Widget>[
    ProductsPage(
      products: products, 
      addItem: addItem, 
      removeItem: removeItem,
      checkoutItems: checkoutItems,
    ),
    CheckoutPage(
      checkoutItems: checkoutItems, 
      removeItem: removeItemByCartItem, 
      addItem: addItemByCartItem,
      clearCheckout: clearCheckout,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const Toolbar(
        title: AppStrings.appName,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: _widgetOptions(context, _products, _checkoutItems, _addItemToCheckout, _addItemToCheckoutByCartItem, _removeItemFromCheckout,_removeItemFromCheckoutByCartItem, _clearCheckout,).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.primary2,
      ),
    );
  }
}