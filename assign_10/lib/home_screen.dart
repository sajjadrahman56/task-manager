import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter your name",
                      ),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {},
                      child: const Text("Add"),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.amber,
              ),
            ),
          ],
        ));
  }
}
