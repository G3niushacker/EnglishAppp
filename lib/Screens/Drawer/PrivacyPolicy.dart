import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}
PublicConstrains constrains = PublicConstrains();
Privacy privacy = Privacy();
class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: constrains.actnclrgrn,
        title: Text("Privacy & Policy"),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Text("About App"),
                    SizedBox(height: 20,),
                    Icon(Icons.dashboard,size: 80,color: constrains.ylwclr,),
                    SizedBox(height: 5,),
                    Text("Version"),
                    SizedBox(height: 5,),
                    Text("3.2.2"),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Our Privacy & Policy",style: privacy.lebel,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(":السياسةوالخصوصيةالتيتخصتطبيقنا كالتالي",style: privacy.arabic,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("1.   Not to post false, inaccurate, deceptive, or defamatory communications or comments",style: privacy.rules,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2.   Not using any unlawful means to access reports or othersers' data ",style: privacy.rules),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("3.   Do not use our services if you are not legally qualified to complete this agreement on. For example, you are less than 18 years old",style: privacy.rules),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("4.   Not to be exposed to international policies or sovereignties or any discussions that are not related to the communication ",style: privacy.rules),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("5.   Not to violate others' property rights or intellectual property ",style: privacy.rules),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("6.   Disclaimers if a person who is not the missing owner is contacted ",style: privacy.rules),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
