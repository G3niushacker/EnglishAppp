import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
class MyLost extends StatefulWidget {
  @override
  _MyLostState createState() => _MyLostState();
}
PublicConstrains constrains = PublicConstrains();
class _MyLostState extends State<MyLost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constrains.actnclrgrn,
        centerTitle: true,
        elevation: 0.0,
        title: Text("MyLost"),
      ),
    );
  }
}
