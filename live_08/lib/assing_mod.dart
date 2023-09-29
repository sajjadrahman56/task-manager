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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
        title: const Text('Responsive Builder'),
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
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipOval(
            child: Image.network(
              'https://superstarsbio.com/wp-content/uploads/2018/08/5-24-1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return Image.network(
                    'https://st.adda247.com/https://wpassets.adda247.com/wp-content/uploads/multisite/sites/5/2023/03/30120815/gettyimages-1472307522-1-1680093625.jpg');
              }
              return Image.network(
                  'https://superstarsbio.com/wp-content/uploads/2018/08/5-24-1.jpg');
            },
          ),
        ),
      ),
    ],
  );
}

Widget LendscapeModeWidget() {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipOval(
              child: Image.network(
                'https://superstarsbio.com/wp-content/uploads/2018/08/5-24-1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Text(
              'Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return Image.network(
                        'https://st.adda247.com/https://wpassets.adda247.com/wp-content/uploads/multisite/sites/5/2023/03/30120815/gettyimages-1472307522-1-1680093625.jpg');
                  }
                  return Image.network(
                      'https://superstarsbio.com/wp-content/uploads/2018/08/5-24-1.jpg');
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
