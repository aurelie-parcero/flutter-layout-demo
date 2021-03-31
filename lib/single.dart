import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_tester/unsplash.dart';
import 'url_launcher.dart';

class ImageArguments {
  final UnsplashImage unsplashImage;

  ImageArguments(this.unsplashImage);
}

class Single extends StatelessWidget {
  static const routeName = '/single';

  @override
  Widget build(BuildContext context) {
    final ImageArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(args.unsplashImage.id),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: <Color>[Colors.pink, Colors.pink[900]])),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(args.unsplashImage.rawUrl),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                      padding: const EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(bottom: 70),
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(3)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  child: args.unsplashImage.description != null
                                      ? Text(args.unsplashImage.description)
                                      : null),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      args.unsplashImage.userProfileImage)),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                      args.unsplashImage.userName != null
                                          ? 'by ' + args.unsplashImage.userName
                                          : ' by Anonymous',
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                  child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black.withOpacity(0.5))),
                                  // <-- Does not work

                                  icon: Icon(Icons.cloud_download),
                                  label: Text('Download'),
                                  onPressed: () {},
                                ),
                              )),
                              Flexible(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: TextButton.icon(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Colors
                                                    .black
                                                    .withOpacity(0.5))),
                                        // <-- Does not work

                                        icon: Icon(Icons.camera_enhance),
                                        label: Text('Photographer'),
                                        onPressed: () {},
                                      )))
                            ],
                          )
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
