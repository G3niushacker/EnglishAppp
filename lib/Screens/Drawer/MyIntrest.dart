import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
PublicConstrains constrains = PublicConstrains();
class MyIntrest extends StatefulWidget {
  @override
  _MyIntrestState createState() => _MyIntrestState();
}

class _MyIntrestState extends State<MyIntrest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: constrains.actnclrgrn,
        centerTitle: true,
        elevation: 0.0,
        title: Text("My Interest"),
      ),
    );
  }
}
