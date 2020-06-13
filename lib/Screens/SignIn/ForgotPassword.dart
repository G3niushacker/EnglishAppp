import 'package:englishapp/Config/Constrains.dart';
import 'package:englishapp/Screens/SignIn/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:englishapp/Screens/BottomNavBar.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}
PublicConstrains constrains = PublicConstrains();
SignInConstrains signConstrain = SignInConstrains();
class _ForgotPasswordState extends State<ForgotPassword> {

  String email;
  bool isClicked = false;
  String _error;

  resetPassword(String email) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
    catch(e){
      setState(() {
        _error = e.message;
      });

    }
  }

  showError(){
    if(_error != null){
      return Container(
        color: Colors.yellow,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.error_outline,color: Colors.red,),
            SizedBox(width: 5.0,),
            Expanded(
              child: Text(_error,style: signConstrain.error,),
            )
          ],
        ),
      );
    }else{
      return SizedBox(
        height: 0,
      );
    }
  }

GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constrains.actnclrgrn,
        title: Text("Forget Your password"),
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => BottomNavBar()
            ));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
          key: _key,
          child: ListView(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Your welcome in",style: signConstrain.blutxt,),
              ],
            ),
            Image.asset("images/logo.jpg",height: 100,width: 100,),
            showError(),
            Container(
              child: isClicked ?  Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("We will Mail You link Please click on that link to rest Password...",style: signConstrain.blutxt,),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(right: 25,left: 25,top: 25),
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => SignIn()
                        ));
                      },
                      child: Text("Back to Signin",style: signConstrain.lebelStyle,),
                      color: constrains.ylwclr,
                    ),
                  )
                ],
              ) :Column(
                children: <Widget>[
                  Padding(
              padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 20.0),
              child: Row(
                children: <Widget>[
                  Text("Email",style: signConstrain.lebelStyle,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onSaved: (value){
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                validator: (String value){
                    if(value.isEmpty){
                      return "Email is required";
                    }
                    if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                      return 'Please enter a valid email Address';
                    }
                  },
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
                    padding: const EdgeInsets.only(right: 25,left: 25,top: 25),
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        _key.currentState.save();
                            if(_key.currentState.validate()){
                              resetPassword(email);
                              setState(() {
                                isClicked = true;
                              });
                              
                            }
                      },
                      child: Text("Continue",style: signConstrain.lebelStyle,),
                      color: constrains.ylwclr,
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}