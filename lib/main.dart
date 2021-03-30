import 'package:flutter/material.dart';

import 'cornered_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                ),
                CorneredContainer(borderRadius: 50, color: Colors.greenAccent,)
              ],
            ),
            SizedBox(height: 25,),
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.red,
            ),
            SizedBox(height: 25,),
            ElementGridThreeItems(),
            SizedBox(height: 25,),
            ElementGridThreeItems(),
            SizedBox(height: 25,),
            Container(
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(width: 25,),
                  Expanded(
                    flex:1,
                      child: Container(
                    color: Colors.greenAccent,
                  ))
                ],
              ),
            ),
            ElementGridThreeItems(),
            SizedBox(height: 25,),
            ElementGridThreeItems(),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}


class ElementGridThreeItems extends StatelessWidget {
  const ElementGridThreeItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.amber,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.amber,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.amber,
        ),
      ],
    );
  }
}
