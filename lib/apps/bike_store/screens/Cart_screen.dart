import 'package:flutter/material.dart';
import 'package:multi_app/apps/bike_store/Components/bottom_cart_screen.dart';
import 'package:multi_app/apps/bike_store/Components/shoppingList_cart_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'My Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 32),
              child: Text(
                '2 Items',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xd2444444)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 110,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '30 %',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          'OFF',
                          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Use code ',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '95218',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' at checkout',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const ShoppingList(),
            const BottomSide(),
          ],
        ),
      ),
    );
  }
}
