import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}
PublicConstrains constrains = PublicConstrains();
class _SettingsState extends State<Settings> {

  bool notification = false;

  onClicked(bool value){
    setState(() {
      notification = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: constrains.actnclrgrn,
        title: Text("Settings"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Personal Data"),
            onTap: (){},
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Language"),
            onTap: (){},
          ),
          Divider(
            thickness: 2,
          ),
          SwitchListTile(
            value: notification,
            onChanged: onClicked,
            secondary: Icon(Icons.notifications),
            activeColor: constrains.actnclrgrn,
            title: Text("Message Notification"),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
