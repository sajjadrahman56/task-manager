import 'package:flutter/material.dart';
import 'package:mod_7/cart_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Map<int, int> cart = {};
  static int totalProduct = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(
                Icons.mobile_friendly,
                color: Colors.deepOrange,
              ),
              title: Text('Vivo ES ${index + 1}'),
              subtitle: Text('${(10.50 * index) + 2}'),
              trailing: Column(
                children: [
                  Text('Count : ${cart[index] ?? 0}'),
                  Container(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (cart[index] == 4) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Congratulation'),
                                    content: Text(
                                        'You bought ${index + 1} product 5!'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          }

                          if (cart.containsKey(index)) {
                            cart[index] = cart[index]! + 1;
                          } else {
                            cart[index] = 1;
                          }

                          print(cart[index]);
                        });
                      },
                      child: const Text('Buy Now'),
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cart.forEach((key, value) {
              if (value != 0) totalProduct++;
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ShowProductCatNo(productNumber: '$totalProduct')),
            );
          });
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
