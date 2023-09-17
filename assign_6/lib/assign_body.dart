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
          Text(
            'Sajjad Ahmed saju',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              labelText: 'Search',
            )),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.green,
              height: 300,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [
                  Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        height: 100,
                        width: 130,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Photo 1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        height: 100,
                        width: 130,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Photo 1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        height: 100,
                        width: 130,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Photo 1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        height: 100,
                        width: 130,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Photo 1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        height: 100,
                        width: 120,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Photo 1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        height: 100,
                        width: 120,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Photo 1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        height: 100,
                        width: 120,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Photo 1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        height: 100,
                        width: 120,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Photo 1",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.amber,
            height: 280,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.red,
            height: 40,
          ),
        ],
      ),
    ));
  }
}



/*

 return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text('THis is sajad'),
                  Text('THis is sajad'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Search',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SingleChildScrollView(
                      child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Apples'),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Rice'),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Mango'),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Watermelon'),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Oranges'),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Oranges'),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Oranges'),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Oranges'),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ));
  
  

*/
 
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomeScreen'),
//       ),
//       body: Scrollbar(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Welcome to Photo Gallery !                 ",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 18,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(
//                   horizontal: 20), // Adjust the margin as needed
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   labelText: 'Search',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             GridView.count(
//               shrinkWrap: true,
//               crossAxisCount: 3,
//               children: [
//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 100,
//                       width: 120,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "Photo 1",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 100,
//                       width: 120,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "Photo 1",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 100,
//                       width: 120,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "Photo 1",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 100,
//                       width: 120,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "Photo 1",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 100,
//                       width: 120,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "Photo 1",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 100,
//                       width: 120,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "Photo 1",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),

//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 80,
//                       width: 100,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text("_counter"),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 80,
//                       width: 100,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text("_counter"),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Image.network(
//                       'https://picsum.photos/250?image=9',
//                       height: 80,
//                       width: 100,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text("_counter"),
//                   ],
//                 ),
//                 // Add more items here
//               ],
//             ),
//             ListView(
//               shrinkWrap: true,
//               children: [
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Apples'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Bananas'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Bread'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Milk'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Eggs'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Rice'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Mango'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Watermelon'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.shopping_bag),
//                   title: Text('Oranges'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
