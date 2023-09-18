import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ], title: Text('HomeScreen')),
      body: BodyPart(),
    );
  }
}

class BodyPart extends StatelessWidget {
  BodyPart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          _verticalGap(15),
          _welcomeTextMessage('Welcome to Photo Gallery !'),
          _verticalGap(20),
          _textField(),
          _verticalGap(15),
          SingleChildScrollView(
            child: Container(
              height: 270,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 5,
                children: [
                  _GridItem('https://tinyurl.com/yeywese', 1, context),
                  _GridItem('https://picsum.photos/250?image=9', 2, context),
                  _GridItem('https://tinyurl.com/yeywese', 3, context),
                  _GridItem('https://picsum.photos/250?image=9', 4, context),
                  _GridItem('https://tinyurl.com/yeywese', 5, context),
                  _GridItem('https://tinyurl.com/yeywese', 6, context),
                  _GridItem('https://tinyurl.com/yeywese', 7, context),
                ],
              ),
            ),
          ),
          _verticalGap(10),
          SingleChildScrollView(
            child: Container(
              height: 210,
              child: ListView(
                children: [
                  _ListItems('https://tinyurl.com/yeywese', 1, context),
                  _ListItems('https://picsum.photos/250?image=9', 2, context),
                  _ListItems('https://tinyurl.com/yeywese', 3, context),
                  _ListItems('https://picsum.photos/250?image=9', 4, context),
                  _ListItems('https://tinyurl.com/yeywese', 5, context),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  mySnackbar('Image Upload Sucessfull', context);
                },
                child: Icon(
                  Icons.upload_rounded,
                  size: 50,
                  color: Colors.blue,
                ),
              )),
        ],
      ),
    ));
  }
}

Widget _welcomeTextMessage(String Message) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      "$Message                 ",
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _textField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
        decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      labelText: 'Search',
    )),
  );
}

Widget _verticalGap(double n) {
  return SizedBox(
    height: n,
  );
}

Widget _GridItem(String imageLink, int index, BuildContext context) {
  return GestureDetector(
    child: Column(
      children: [
        Image.network(
          '$imageLink',
          height: 100,
          width: 120,
        ),
        _verticalGap(4),
        Text(
          "Photo $index",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    onTap: () {
      mySnackbar('Grid image no = $index', context);
    },
  );
}

Widget _ListItems(String imageLink, int index, BuildContext context) {
  return GestureDetector(
    child: ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
            '$imageLink'), // no matter how big it is, it won't overflow
      ),
      title: Text('Watermelon'),
      subtitle: Text('I am cat'),
    ),
    onTap: () {
      mySnackbar('List image no = $index', context);
    },
  );
}

mySnackbar(message, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('$message')));
}
