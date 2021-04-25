import 'package:flutter/material.dart';
import 'package:two_d_grid/modules/two_d_grid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: TwoDGrid()),
      ),
    );
  }
}
