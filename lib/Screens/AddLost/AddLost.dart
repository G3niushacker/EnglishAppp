import 'package:englishapp/Widgets/CommonWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/Config/Constrains.dart';
class AddLost extends StatefulWidget {
  @override
  _AddLostState createState() => _AddLostState();
}
SignInConstrains signConstrain = SignInConstrains();
CommonWidgets widgets = CommonWidgets();
PublicConstrains constrains = PublicConstrains();
class _AddLostState extends State<AddLost> {
  @override
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Firestore firestore = Firestore.instance;
  String title;
  String description;
  String area;
  String city;
  String phone;
  String hashtag;
  bool hashed = false;
  bool checked = false;
  String catval = "set";
  List<String> _categories = ['Cars', 'Mobiles','Motercycle','Money','Jewelery','Bicycle','Papers','Cards','Person','Bags','Birds','Animals','Other',];
  List<String> _country = ['SaudiArabia', 'Eimrates','Palestine','Egypt ','Bahrin','Pakistan','Turkey','United Kindom','India','Bangladesh','United State','Canada','Other',];// Option 2
  String _selectedCategory;
  String _selectedCountry;
  List<String> selected = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: constrains.actnclrgrn,
        title: Text("Add Lost"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text("Categories",style: signConstrain.lebelStyle,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: Container(
                  padding: EdgeInsets.only(right:8,left: 8.0,top: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(3)
                  ),
                  height: 55,
                  width: MediaQuery.of(context).size.height,
                  child: Expanded(
                    child: DropdownButton(
                      hint: Text('Please choose a Catgory                                         '), // Not necessary for Option 1
                      value: _selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategory = newValue;
                        });
                      },
                      items: _categories.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text("Title",style: signConstrain.lebelStyle,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: TextFormField(
                  onSaved: (value){
                    title = value;
                  },
                  validator: (String value){
                    if(value.isEmpty){
                      return "Title is required";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Ex. Toyota car",
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text("Description",style: signConstrain.lebelStyle,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: TextFormField(
                  onSaved: (value){
                    description = value;
                  },
                  validator: (String value){
                    if(value.isEmpty){
                      return "Description is required";
                    }
                  },
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: "Explain the most important specifications and information about the missing",
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
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: Container(
                  padding: EdgeInsets.only(right:8,left: 8.0,top: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(3)
                  ),
                  height: 55,
                  width: MediaQuery.of(context).size.height,
                  child: Expanded(
                    child: DropdownButton(
                      hint: Text('Please choose a Country                                         '), // Not necessary for Option 1
                      value: _selectedCountry,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCountry = newValue;
                        });
                      },
                      items: _country.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text("City",style: signConstrain.lebelStyle,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: TextFormField(
                  onSaved: (value){
                    city = value;
                  },
                  validator: (String value){
                    if(value.isEmpty){
                      return "City is required";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Jaddah",
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text("Area",style: signConstrain.lebelStyle,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: TextFormField(
                  onSaved: (value){
                    area = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Any Place",
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text("Hashtag",style: signConstrain.lebelStyle,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: TextFormField(
                  onSaved: (value){
                    hashtag = value;
                  },
                  decoration: InputDecoration(
                      hintText: "# hashtags",
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
                padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
                child: TextFormField(
                  onSaved: (value){
                    phone = value;
                  },
                  validator: (String value){
                    if(value.isEmpty){
                      return "Mobile is required";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "+1 786 1245 123",
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
                  Expanded(child: Text("Would you like your mobile number to appear in the author?"))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25,left: 25,top: 10,bottom: 10),
                child: MaterialButton(
                  shape: StadiumBorder(),
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Lost(category: _categories,title : title, description : description, country: _country, city : city,area: area,phone: phone,selectedCategory : _selectedCategory,selectedCountry: _selectedCountry)
                    ));
                  },
                  child: Text("Next",style: signConstrain.lebelStyle,),
                  color: constrains.actnclrgrn,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
class Lost extends StatefulWidget {
  String title;
  String description;
  String area;
  String city;
  String phone;
  var country;
  var category;
  String selectedCountry;
  String selectedCategory;


  Lost({this.title,this.description,this.area,this.city,this.phone,this.country,this.category,this.selectedCountry,this.selectedCategory});

  @override
  _LostState createState() => _LostState(title,description,area,city,phone,country,category,selectedCategory,selectedCountry);
}

class _LostState extends State<Lost> {
  int height = 180;
  String title;
  String description;
  String area;
  String city;
  String phone;
  var country;
  var category;
  String selectedCountry;
  String selectedCategory;
  _LostState(this.title,this.description,this.area,this.city,this.phone,this.country,this.category,this.selectedCountry,this.selectedCategory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: constrains.actnclrgrn,
        title: Text("Add Lost"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
            child: Row(
              children: <Widget>[
                Text("The approximate price of the missing",style: signConstrain.lebelStyle,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
            child: TextFormField(
              onSaved: (value){
                widget.phone = value;
              },
              validator: (String value){
                if(value.isEmpty){
                  return "Price is required";
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: "10,000 SAR",
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:10.0,left: 10.0,top: 10.0),
            child: Row(
              children: <Widget>[
                Text("Reward",style: signConstrain.lebelStyle,),
              ],
            ),
          ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: constrains.ylwclr,
                thumbColor: constrains.ylwclr,
                overlayColor: constrains.ylwclr,
                trackHeight: 10.0,
                valueIndicatorColor: constrains.ylwclr,
                thumbShape:
                RoundSliderThumbShape(enabledThumbRadius: 10.0),
                overlayShape:RoundSliderOverlayShape(overlayRadius: 10.0),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 100.0,
                max: 5000.0,
                onChanged: (value){
                  setState(() {
                    height = value.round();
                  });
                },
                divisions: 10,
                label: "${height}",
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right:20.0,left: 20.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text("100 SAR"),
                Text(
                  '5,000 SAR',
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("NOTE:",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Upon finding your lost items, 50% of the reward value is transferred to whoever found it and 50% for the application"),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(right: 25,left: 25,top: 10,bottom: 10),
            child: MaterialButton(
              shape: StadiumBorder(),
              height: 50,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => BottomAppBar()
                ));
              },
              child: Text("Add",style: signConstrain.lebelStyle,),
              color: constrains.ylwclr,
            ),
          ),
        ],
      ),
    );
  }
}

