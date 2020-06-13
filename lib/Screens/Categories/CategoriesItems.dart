import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
import 'package:englishapp/Widgets/CommonWidgets.dart';

class CategoriesItems extends StatefulWidget {
  String category;
  CategoriesItems({this.category});
  @override
  _CategoriesItemsState createState() => _CategoriesItemsState(category);
}
PublicConstrains constrains = PublicConstrains();
SignInConstrains _signInConstrains = SignInConstrains();
CommonWidgets widgets = CommonWidgets();
class _CategoriesItemsState extends State<CategoriesItems> {

  String category;
  _CategoriesItemsState(this.category);

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
        child: InkWell(
          onTap: (){
            category = title;
          },
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constrains.actnclrgrn,
        centerTitle: true,
        elevation: 0.0,
        title: Text(category),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 60,
                child: Flexible(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      catlist("images/car.png", "Car", Colors.blueAccent, context),
                      catlist("images/mobile.png", "Mobile", Colors.deepOrange, context),
                      catlist("images/bike.png", "Motorcycle", Colors.deepPurple, context),
                      catlist("images/money.png", "Money", Colors.orangeAccent, context),
                      catlist("images/jewlry.png", "Jewelery", Colors.green, context),
                      catlist("images/bicycle.png", "Bicycle", Colors.purple, context),
                      catlist("images/papers.png", "Papers", Colors.purple, context),
                      catlist("images/card.png", "Cards", Colors.purple, context),
                      catlist("images/person.png", "Persons", Colors.purple, context),
                      catlist("images/bicycle.png", "Bags", Colors.purple, context),
                      catlist("images/bicycle.png", "Birds", Colors.purple, context),
                      catlist("images/bicycle.png", "Animals", Colors.purple, context),
                      SizedBox(width: 5,)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

