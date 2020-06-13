import 'package:englishapp/Config/Constrains.dart';
import 'package:englishapp/Screens/BottomNavBar.dart';
import 'package:englishapp/Screens/SignIn/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
PublicConstrains constrains = PublicConstrains();
SignInConstrains signConstrain = SignInConstrains();
Firestore firestore = Firestore.instance;
class _SignUpState extends State<SignUp> {
  String name;
  String email;
  String password;
  String confirmPassword;
  String country;
  String phone;
  bool checked = false;
  bool isLoading = false;
  String signInUeser;
  
  signinwithemail()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,
    password: password).then((signedInUser){
    firestore.collection('user').add({'email': email, 'password': password,'name': name,'confirmPassword': confirmPassword,'phone': phone, 'country': country}).then((value){
        if(signedInUser!= null){
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => BottomNavBar()
          ));
        }
      }).catchError((e){
        return print(e.message);});
    });
  }

  showProgress(){
    if(isLoading){
      return Container(
          height: MediaQuery.of(context).size.height / 1,
          child: Center(child: CircularProgressIndicator(),));
    }else{
      return Container(height: 0.0,width: 0.0,);
    }
  }

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constrains.actnclrgrn,
        title: Text("Sign Up"),
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => SignIn()
            ));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: _formkey,
          child: ListView(
          children: <Widget>[
            Padding(
                    padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text("Name",style: signConstrain.lebelStyle,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                    child: TextFormField(
                      onSaved: (value){
                        name = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value){
                          if(value.isEmpty){
                            return "Name is required";
                          }
                        },
                        decoration: InputDecoration(
                        hintText: "Enter Name",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                     padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                     child: Row(
                      children: <Widget>[
                        Text("Email",style: signConstrain.lebelStyle,),
                      ],
                  ),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 10.0,right: 10.0),
                    child: TextFormField(
                       onSaved: (value){
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value){
                          if(value.isEmpty){
                            return "Email is required";
                          }else if (!RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(value)) {
                              return 'Please enter a valid email Address';
                          }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Email Address",
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
                  Padding(
                     padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                     child: Row(
                      children: <Widget>[
                        Text("Confirm Password",style: signConstrain.lebelStyle,),
                      ],
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 10.0,right: 10.0),
                    child: TextFormField(
                       onSaved: (value){
                        confirmPassword = value;
                      },
                      obscureText: true,
                      validator: (String value){
                          if(value.isEmpty){
                            return "Confirm Password is required";
                          }
                        },
                      decoration: InputDecoration(
                        hintText: "Enter Confirm Password",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                     padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                     child: Row(
                      children: <Widget>[
                        Text("Country",style: signConstrain.lebelStyle,),
                      ],
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 10.0,right: 10.0),
                    child: TextFormField(
                       onSaved: (value){
                        country = value;
                      },
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
                   Padding(
                     padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                     child: Row(
                      children: <Widget>[
                        Text("Mobile",style: signConstrain.lebelStyle,),
                      ],
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 10.0,right: 10.0),
                    child: TextFormField(
                       onSaved: (value){
                        phone = value;
                      },
                      keyboardType: TextInputType.phone,
                      validator: (String value){
                          if(value.isEmpty){
                            return "Phone is required";
                          }
                        },
                      decoration: InputDecoration(
                        hintText: "Enter Mobile",
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                Row(
                  children: <Widget>[
                    Checkbox(
                  value: checked,
                  onChanged: (value){
                    setState(() {
                      checked = value;
                    });
                  },
                ),
                Text("Agree to our Policy and Privacy")
                  ],
                ),
                 Padding(
                    padding: const EdgeInsets.only(right: 25,left: 25),
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () async {
                        signinwithemail();
                        _formkey.currentState.save();
                        if(_formkey.currentState.validate()){
                          signinwithemail();
//                          Navigator.pushReplacement(context, MaterialPageRoute(
//                            builder: (context) => BottomNavBar()
//                          ));
                          setState(() {
                            isLoading = true;
                          });
                        }
                      },
                      child: Text("Sign up",style: signConstrain.lebelStyle,),
                      color: constrains.actnclrgrn,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top:8.0,right: 10.0,left: 12.0),
              child: Row(
                children: <Widget>[
                  Text("Already Have an account?"),
                  FlatButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => SignIn()
                      ));
                    },
                    child: Text("Sign in",style: TextStyle(color: Colors.blue),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
