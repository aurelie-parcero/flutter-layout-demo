import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UnsplashImage {
  String id;
  String description;
  String regularUrl;
  String rawUrl;
  String userName; //Attribution to the photographer
  String userProfileUrl; //Photographer's profile
  String userProfileImage; //Photographer's profile image
  int likes;
  String blurHash; //Optional
  String downloadLocation; //Optional
  Color color; //Optional

  UnsplashImage({@required this.id,
    @required this.description,
    @required this.rawUrl,
    @required this.regularUrl,
    @required this.userName,
    this.userProfileImage,
    this.downloadLocation});

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {

    return UnsplashImage(
        id: json['id'],
        description: json['description'],
        rawUrl: json['urls']['raw'],
        regularUrl: json['urls']['regular'],
        userName: json['user']['name'],
        userProfileImage: json['user']['profile_image']['small']
    );
  }
}

Future<List<UnsplashImage>> fetchUnsplashImage() async {
  final response = await http.get(Uri.https('api.unsplash.com', '/photos', {
    'client_id': 'QwMKgrer8mvnc7Nsv7BdC-6KCqgike2Lbjilbf6Ttgc',
    'per_page': '100'
  }));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonArray = jsonDecode(response.body);
    List<UnsplashImage> imageList = [];
    for (var i = 0; i < jsonArray.length; i++) {

      imageList.add(UnsplashImage.fromJson(jsonArray[i]));
    }

    return imageList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load album');
  }
}
