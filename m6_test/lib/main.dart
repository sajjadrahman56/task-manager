import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  List<String> items = [
    'Apples',
    'Bananas',
    'Bread',
    'Milk',
    'Eggs',
    'Rice',
    'Mango',
    'Watermelon',
    'Oranges',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Shopping List'),
        actions: [
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (int i = 0; i < items.length; i++)
              ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text('${items[i]}'),
              ),
          ],
        ),
      ),
    );
  }
}
