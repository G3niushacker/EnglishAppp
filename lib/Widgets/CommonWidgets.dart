import 'package:flutter/cupertino.dart';
import 'package:englishapp/Config/Constrains.dart';
import 'package:flutter/material.dart';

class CommonWidgets{
  SignInConstrains _signInConstrains = SignInConstrains();

  Widget dropDownCat(String value, changed){
    return Padding(
      padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
      child: DropdownButtonFormField(
        value: value,
        hint: Text("Category"),
        onChanged: (val){
          changed = val;
        },
        items: <String>["Car", "Mobile", "Motercycle","Bicycle"]
            .map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              );
        }),
      ),
    );
  }

  Widget catlist(String image, String title, Color color, BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Container(
        height: 60,
//      width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            border: Border.all(
                color: color
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(image,height: 70,width: 70,),
            SizedBox(width: 5,),
            Text(title,style: _signInConstrains.lebelStyle,),
            SizedBox(width: 5,),
          ],
        ),
      ),
    );
  }

}