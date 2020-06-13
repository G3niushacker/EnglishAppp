import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}
PublicConstrains constrains = PublicConstrains();
ChatConstrains chatConstrains = ChatConstrains();
class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constrains.actnclrgrn,
        centerTitle: true,
        elevation: 0.0,
        title: Text("Chat"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/emptymessage.png"),
          SizedBox(height: 20,),
          Text("It's nice to chat someone",style: chatConstrains.emptylbl,)
        ],
      ),
    );
  }
}
