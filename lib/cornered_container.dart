
import 'package:flutter/material.dart';

class CorneredContainer extends StatelessWidget {

  final double borderRadius;
  final Color color;

  const CorneredContainer({Key key, this.borderRadius, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius)
      ),

    );
  }
}