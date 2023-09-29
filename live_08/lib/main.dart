import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
        backgroundColor: Colors.blue, // set the background color to blue
      ),
      body: OrientationLayoutBuilder(
        portrait: (context) => protiteModeWidget(),
        landscape: (context) => LendscapeModeWidget(),
      ),
    );
  }
}

Widget protiteModeWidget() {
  return Column(
    children: [
      Expanded(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Card(
              shadowColor: Colors.deepPurple,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  'https://via.placeholder.com/150',
                  //'https://st.adda247.com/https://wpassets.adda247.com/wp-content/uploads/multisite/sites/5/2023/03/30120815/gettyimages-1472307522-1-1680093625.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
            );
          },
        ),
      )),
    ],
  );
}

Widget LendscapeModeWidget() {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: 15,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.deepPurple,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    width: 150,
                    height: 150,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}
