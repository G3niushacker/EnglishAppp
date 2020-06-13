import 'package:englishapp/Services/FirebaseModels.dart';
import 'package:englishapp/Widgets/CommonWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
import 'package:englishapp/Screens/Drawer/PrivacyPolicy.dart';
import 'package:englishapp/Screens/Drawer/Settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
SignInConstrains _signInConstrains = SignInConstrains();
CommonWidgets widgets = CommonWidgets();
FirebaseMethods firebase = FirebaseMethods();
PublicConstrains constrains = PublicConstrains();
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: constrains.actnclrgrn,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
               DrawerHeader(
                 child: FutureBuilder(
                   future: firebase.getCurrentUser(),
                   builder: (context, snapshot){
                     if(snapshot.connectionState == ConnectionState.done){
                       return Row(
                         children: <Widget>[
                           CircleAvatar(
                             radius: 40,
                           ),
                           SizedBox(width: 20,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Text(snapshot.data.displayName.toString()),
                               SizedBox(height: 10,),
                               Text(snapshot.data.email)
                             ],
                           )
                         ],
                       );
                     }else{
                       return CircularProgressIndicator();
                     }
                   },
                 )
               ),
                ListTile(
                  leading: Icon(Icons.content_paste,color: Colors.white,),
                  title: Text('My Lost',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.fitness_center,color: Colors.white,),
                  title: Text('My interets',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.share,color: Colors.white,),
                  title: Text('Share App',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.star_border,color: Colors.white,),
                  title: Text('Rate App',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings,color: Colors.white,),
                  title: Text('Settings',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Settings()
                    ));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.security,color: Colors.white,),
                  title: Text('Privacy & Policy',style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PrivacyPolicy()
                    ));
                  },
                ),
                SizedBox(height: 20,),
                ListTile(
                  leading: Icon(Icons.exit_to_app,color: Colors.white,),
                  title: Text('Sign out',style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ),
              ],
            ),
          )
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.0), // here the desired height
            child: AppBar(
              backgroundColor: constrains.actnclrgrn,
              title: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey
                      ),
                      color: Color(0xff7ec1a3),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  height: 48,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                  ),
                ),
              ),
            ),
        ),
        body: Column(
          children: <Widget>[
            Image.asset("images/topbnr.png",fit: BoxFit.fill,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Catgories",style: _signInConstrains.lebelStyle,),
                  FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: (){},
                    child: Text("see all"),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              child: Flexible(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    widgets.catlist("images/car.png", "Car", Colors.blueAccent, context),
                    widgets.catlist("images/mobile.png", "Mobile", Colors.deepOrange, context),
                    widgets.catlist("images/bike.png", "Motorcycle", Colors.deepPurple, context),
                    widgets.catlist("images/money.png", "Money", Colors.orangeAccent, context),
                    widgets.catlist("images/jewlry.png", "Jewelery", Colors.green, context),
                    widgets.catlist("images/bicycle.png", "Bicycle", Colors.purple, context),
                    SizedBox(width: 5,)
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}