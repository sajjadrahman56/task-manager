 import 'package:flutter/material.dart';
import '../widget/catch_image.dart';

class IndividualPage extends StatelessWidget {
  const IndividualPage({Key? key, required this.title, required this.id ,required this.url})
      : super(key: key);
  final String title;
  final String url;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                child:   buildLeadingWidget(url.toString()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
      
Padding(
  padding: EdgeInsets.only(left: 35),
  child: Text(
    'Title :  $title',
    style: TextStyle(fontSize: 14),
  ),
)
,
            Text(
              'Id :  $id',
              style: TextStyle(fontSize: 14,  ),
            ),
          ],
        ),
      ),
    );
  }
}

