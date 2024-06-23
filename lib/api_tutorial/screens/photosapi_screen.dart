import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/photos_model.dart';

class PhotoApiScreen extends StatefulWidget {
  const PhotoApiScreen({super.key});

  @override
  State<PhotoApiScreen> createState() => _PhotoApiScreenState();
}

class _PhotoApiScreenState extends State<PhotoApiScreen> {
  List<PhotoModel> photo = [];
  Future<List<PhotoModel>> getPhoto() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotoModel photos = PhotoModel(title: i['title'], url: i['url']);
        photo.add(photos);
      }
      return photo;
    } else {
      return photo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhotoApi'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhoto(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: photo.length,
                    itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                    ),
                    title: Text(snapshot.data![index].title.toString()),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
