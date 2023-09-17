import 'package:flutter/material.dart';

import 'assign_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen() // PrecticeHome(),
        );
  }
}

class PrecticeHome extends StatelessWidget {
  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(35),
      shadowColor: Colors.amber,
      elevation: 8,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {
                MySnackBar("I am a Text Button", context);
              },
              child: Text("Button 1")),
          ElevatedButton(
            onPressed: () {
              MySnackBar("I am a Elevated Button", context);
            },
            child: Text('Elevated Button'),
            style: buttonStyle,
          ),
          OutlinedButton(
              onPressed: () {
                MySnackBar('I am outlinebutton', context);
              },
              child: Text('Outline Button')),
        ],
      ),
    );
  }
}
