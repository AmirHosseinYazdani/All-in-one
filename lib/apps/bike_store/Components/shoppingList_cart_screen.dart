import 'package:flutter/material.dart';
import 'package:multi_app/apps/bike_store/Components/round_icon_button.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image(
                          image: NetworkImage(
                              'https://images-na.ssl-images-amazon.com/images/I/81yPs7rR%2BiL._SX425_.jpg')),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bicycle Red/Yellow',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              r'$859.00',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                RoundIconButton(
                                  icon: const Icon(Icons.remove),
                                  onPress: () {},
                                ),
                                const Text(
                                  ' 1 ',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 20),
                                ),
                                RoundIconButton(
                                  icon: const Icon(Icons.add),
                                  onPress: () {},
                                ),
                              ],
                            ),
                            RoundIconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPress: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
