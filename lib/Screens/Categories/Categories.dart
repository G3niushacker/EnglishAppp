import 'package:englishapp/Screens/Categories/CategoriesItems.dart';
import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}
PublicConstrains constrains = PublicConstrains();
class _CategoriesState extends State<Categories> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: constrains.actnclrgrn,
        centerTitle: true,
        title: Text("Categories"),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 3 ,
          children: <Widget>[
             grid("images/car.png",  "Car",context),
            grid("images/mobile.png","Mobile", context),
            grid("images/bike.png",  "Motercycle",context),
            grid("images/money.png",  "Money",context),
            grid("images/jewlry.png",  "Jewelery",context),
            grid("images/bicycle.png",  "Bicycle",context),
            grid("images/papers.png",  "Paper",context),
            grid("images/card.png",  "Cards",context),
            grid("images/person.png",  "Person",context),
            grid("images/bags.png",  "Bags",context),
            grid("images/birds.png",  "Birds",context),
            grid("images/animals.png",  "Animal",context),
            grid("images/other.png",  "Other",context),
          ],
        ),
      ),
    );
  }
}
Widget grid(String image, String title, BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => CategoriesItems(category: title,)
      ));
    },
    child: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset(image,height: 80,),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Text(title)
          ],
        )
    ),
  );
}
