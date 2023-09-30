import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: OrientationLayoutBuilder(
        portrait: (context) => protiteModeWidget(),
        landscape: (context) => LendscapeModeWidget(),
      ),
    );
  }
}

Widget protiteModeWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
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
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sakib Al Hasan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Sakib Al Hasan is a Bangladeshi cricketer who is considered one of the'
                'best all-rounders in the world. He has represented Bangladesh in all',
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
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
    ),
  );
}

Widget LendscapeModeWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
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
            Expanded(
              flex: 1,
              child: Wrap(
                children: [
                  Text(
                    'Sakib Al Hasan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sakib Al Hasan is a Bangladeshi man cricketer who is considered one of the who has represented Bangladesh in all time in the world',
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: .5,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index % 2 == 0) {
                      return Image.network(
                        'https://st.adda247.com/https://wpassets.adda247.com/wp-content/uploads/multisite/sites/5/2023/03/30120815/gettyimages-1472307522-1-1680093625.jpg',
                        height: 200,
                        width: 150,
                      );
                    }
                    return Image.network(
                        height: 200,
                        width: 150,
                        'https://superstarsbio.com/wp-content/uploads/2018/08/5-24-1.jpg');
                  },
                ),
              ),
            ),
          ],
        ))
      ],
    ),
  );
}
