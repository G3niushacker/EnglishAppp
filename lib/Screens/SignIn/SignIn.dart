import 'package:englishapp/Config/Constrains.dart';
import 'package:englishapp/Screens/BottomNavBar.dart';
import 'package:englishapp/Screens/SignIn/ForgotPassword.dart';
import 'package:englishapp/Screens/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}
PublicConstrains constrains = PublicConstrains();
SignInConstrains signConstrain = SignInConstrains();
class _SignInState extends State<SignIn> {
  @override
  String email;
  String password;
  bool isLoading = false;
  String _error;


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

   showProgress(){
    if(isLoading){
      return Center(child: LinearProgressIndicator(
        backgroundColor: constrains.ylwclr,
      ),);
    }else{
      return Container(height: 0.0,width: 0.0,);
    }
  }
   
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
          child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                showProgress(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Your welcome in",style: signConstrain.blutxt,),
                  ],
                ),
                Image.asset("images/logo.jpg",height: 100,width: 100,),
                showError(),
                Padding(
                  padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
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
                   padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                   child: Row(
                    children: <Widget>[
                      Text("Password",style: signConstrain.lebelStyle,),
                    ],
                ),
                 ),
                Padding(
                  padding: const EdgeInsets.only(top:10,left: 10.0,right: 10.0),
                  child: TextFormField(
                     onSaved: (value){
                      password = value;
                    },
                    obscureText: true,
                    validator: (String value){
                        if(value.isEmpty){
                          return "Password is required";
                        }
                      },
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => ForgotPassword()
                        ));
                      },
                      child: Text("Forget your password?",style: TextStyle(color: Colors.lightBlue),),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25,left: 25),
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () async {
                       _globalKey.currentState.save();
                      if(_globalKey.currentState.validate()){
                        setState(() {
                          isLoading = true;
                        });
                         await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password).then((firebaseUser){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => BottomNavBar()
                          ));
                        }).catchError((e){
                          setState(() {
                            _error = e.message;
                          });
                        });
                      }
                    },
                    child: Text("Sign in",style: signConstrain.lebelStyle,),
                    color: constrains.actnclrgrn,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    FlatButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => SignUp()
                        ));
                      },
                      child: Text("Sign up",style: TextStyle(color: Colors.lightBlue),),
                    )
                  ],
                ),
                Image.asset("images/design.jpg"),
                Text("Sign in by"),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: constrains.ylwclr
                        ),
                        child: Image.asset("images/fb.png",height: 40,width: 40),
                      )
                    ),
                    MaterialButton(
                      onPressed: (){},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: constrains.ylwclr
                        ),
                        child: Image.asset("images/insta.png",height: 20,width: 20),
                      )
                    ),
                    MaterialButton(
                      onPressed: (){},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: constrains.ylwclr
                        ),
                        child: Image.asset("images/google.png",fit: BoxFit.contain,),
                      )
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
