import 'dart:convert';
import 'package:assign_11/model/model_data.dart';
import 'package:assign_11/widget/catch_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'photo_detailes_screen.dart';

class PhotosHome extends StatefulWidget {
  const PhotosHome({super.key});

  @override
  State<PhotosHome> createState() => _PhotosHomeState();
}

class _PhotosHomeState extends State<PhotosHome> {
  List<PhotoModel> photosList1 = [];

  Future<List<PhotoModel>> getPhotos() async {
    String pathUrl = "https://jsonplaceholder.typicode.com/photos";

    final response = await http.get(Uri.parse(pathUrl));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotoModel photos = PhotoModel(
            albumId: i['albumId'],
            id: i['id'],
            title: i['title'],
            url: i['url']);
        photosList1.add(photos);
      }
      return photosList1;
    } else {
      return photosList1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photo Gallery App "),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPhotos(),
                builder: (context, snapshot) {
                  return ListView.separated(
                    itemCount: photosList1.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IndividualPage(
                                        title: photosList1[index].title,
                                        id: photosList1[index].id,
                                        url: photosList1[index].url.toString(),
                                      )));
                        },
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: buildLeadingWidget(
                              photosList1[index].url.toString()),
                        ),
                        title: Text(photosList1[index].title),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return Divider();
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
