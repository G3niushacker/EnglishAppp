import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/Models/Message.dart';
import 'package:englishapp/Models/User.dart';
import 'package:englishapp/Services/FirebaseRepositry.dart';
import 'package:flutter/material.dart';
import 'package:englishapp/Config/Constrains.dart';
class Conservation extends StatefulWidget {
  final User receiver;

  Conservation({this.receiver});

  @override
  _ConservationState createState() => _ConservationState();
}
FirebaseRepository _repository = FirebaseRepository();
TextEditingController textFieldController = TextEditingController();
PublicConstrains constrains = PublicConstrains();
class _ConservationState extends State<Conservation> {

  FirebaseRepository _repository = FirebaseRepository();

  User sender;

  String _currentUserId;

  bool isWriting = false;

  @override
  void initState() {
    super.initState();

    _repository.getCurrentUser().then((user) {
      _currentUserId = user.uid;

      setState(() {
        sender = User(
          uid: user.uid,
          name: user.displayName,
          profilePhoto: user.photoUrl,
        );
      });
    });
  }

  sendMessage(){
    var text = textFieldController.text;

    Message _message = Message(
      receiverId: widget.receiver.uid,
      senderId: sender.uid,
      message: text,
      timestamp: FieldValue.serverTimestamp(),
      type: 'text',
    );

    _repository.addMessageToDb(_message, sender, widget.receiver);
  }

  Widget messageList() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection("messages")
          .document(_currentUserId)
          .collection(widget.receiver.uid)
          .orderBy("timestamp", descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            return chatMessageItem(snapshot.data.documents[index]);
          },
        );
      },
    );
  }

  Widget chatMessageItem(DocumentSnapshot snapshot) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        alignment: snapshot['senderId'] == _currentUserId
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: snapshot['senderId'] == _currentUserId
            ? senderLayout(snapshot)
            : receiverLayout(snapshot),
      ),
    );
  }

  Widget senderLayout(DocumentSnapshot snapshot) {
    Radius messageRadius = Radius.circular(10);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints:
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: getMessage(snapshot),
      ),
    );
  }

  getMessage(DocumentSnapshot snapshot) {
    return Text(
      snapshot['message'],
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }

  Widget receiverLayout(DocumentSnapshot snapshot) {
    Radius messageRadius = Radius.circular(10);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints:
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: getMessage(snapshot),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(widget.receiver.name),
            SizedBox(
              height: 2.0,
            ),
            Text("35 minute ago",style: TextStyle(fontSize: 15,color: Colors.black),),
          ],
        ),
        backgroundColor: constrains.actnclrgrn,
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            child: messageList(),
          ),
          bottom(),
          SizedBox(height: 5.0,),
        ],
      ),
    );
  }
}
Widget bottom(){
  return Container(
    child: Row(
      children: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.camera_alt),
        ),
        Expanded(
          child: TextField(
            controller: textFieldController,
            decoration: InputDecoration(
              hintText: "Write Message",
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                  borderSide: BorderSide.none),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              filled: true,
            ),
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.send),
        )
      ],
    ),
  );
}


