import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Count:',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.displaySmall!.fontSize),
        ),
        Center(
          child: Text(
            '$counter',
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.displayLarge!.fontSize),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                  if (counter >= 5) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Button pressed $counter times'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Close'))
                            ],
                          );
                        });
                  }
                });
              },
              child: Text('+',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (counter > 0) {
                    counter--;
                  }
                });
              },
              child: Text('-',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ]),
    );
  }
}
