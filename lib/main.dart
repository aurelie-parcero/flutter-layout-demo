import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'unsplash.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'single.dart';

List<String> imageUrlListToDisplay = [
  "https://images.unsplash.com/photo-1616067086678-f05d38cf1fa1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxODU2OTN8MHwxfGFsbHwzfHx8fHx8Mnx8MTYxNjE1MjMzNg&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1616122261020-8b14dbb19102?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxODU2OTN8MHwxfGFsbHwyfHx8fHx8Mnx8MTYxNjE1MjMzNg&ixlib=rb-1.2.1&q=80&w=1080",
  "https://images.unsplash.com/photo-1593642531955-b62e17bdaa9c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxODU2OTN8MXwxfGFsbHwxfHx8fHx8Mnx8MTYxNjE1MjMzNg&ixlib=rb-1.2.1&q=80&w=1080"
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyHomePage(),
        Single.routeName: (context) => Single(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        splashColor: Colors.black,
        textTheme: GoogleFonts.abelTextTheme(
          Theme.of(context).textTheme.apply(
            fontSizeFactor: 1.1,
            fontSizeDelta: 2.0,
          )
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<UnsplashImage>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchUnsplashImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('- Picture Box -'),
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
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: FutureBuilder<List<UnsplashImage>>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return MasonryGrid(
                        column: 2,
                        children: List.generate(
                            snapshot.data.length,
                            (index) => SizedBox(
                                  child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Single.routeName,
                                              arguments: ImageArguments(
                                                  snapshot.data[index]));

                                          // Navigate to second route when tapped.
                                        },
                                        child: Image(
                                          image: NetworkImage(
                                              snapshot.data[index].regularUrl),
                                        ),
                                      )),
                                )));

                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              )))
            ],
          ),
        ));
  }
}
