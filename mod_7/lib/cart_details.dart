import 'package:flutter/material.dart';

class ShowProductCatNo extends StatelessWidget {
  final String productNumber;
  const ShowProductCatNo({super.key, required this.productNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Product Number : $productNumber',
            style: TextStyle(fontSize: 28)),
      ),
    );
  }
}
