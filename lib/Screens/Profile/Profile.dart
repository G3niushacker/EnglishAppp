import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
PublicConstrains constrains = PublicConstrains();
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: constrains.actnclrgrn,
        title: Text("Profile"),
      ),
      body: Column(
        children: <Widget>[
          Image.asset("images/logo.jpg",height: 80,),
          Text("Muhammad"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                onPressed: (){},
                child: Text("Contact"),
              ),
              MaterialButton(
                color: constrains.ylwclr,
                minWidth: 30,
                onPressed: (){},
                child: Icon(Icons.call,color: Colors.white,),
              ),
              MaterialButton(
                color: constrains.ylwclr,
                minWidth: 30,
                onPressed: (){},
                child: Icon(Icons.mail,color: Colors.white,),
              )
            ],
          )
        ],
      ),
    );
  }
}
