import 'dart:convert';
import 'package:assign_11/model/model_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 

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
          centerTitle: true,
          title: Text("API COURSE "),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
                  return ListView.builder(
                      itemCount: photosList1.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        photosList1[index].url.toString()))),
                          
                          ),
                          title: Text(photosList1[index].title),
                           
                        );
                      });
                },
              ),
            )
          ],
        ));
  }
}
