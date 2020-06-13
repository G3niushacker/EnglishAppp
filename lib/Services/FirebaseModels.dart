import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englishapp/Models/Message.dart';
import 'package:englishapp/Models/User.dart';
import 'package:englishapp/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final Firestore firestore = Firestore.instance;

  //user class

  User user = User();

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }


//  Future<FirebaseUser> signIn() async {
//    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
//    GoogleSignInAuthentication _signInAuthentication =
//    await _signInAccount.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: _signInAuthentication.accessToken,
//        idToken: _signInAuthentication.idToken);
//
//    FirebaseUser user = await _auth.signInWithCredential(credential);
//    return user;
//  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    QuerySnapshot result = await firestore
        .collection("users")
        .where("email", isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;

    //if user is registered then length of list > 0 or else less than 0
    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(FirebaseUser currentUser) async {
    String username = Utils.getUsername(currentUser.email);

    user = User(
        uid: currentUser.uid,
        email: currentUser.email,
        name: currentUser.displayName,
        profilePhoto: currentUser.photoUrl,
        username: username);

    firestore
        .collection("users")
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _auth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<User>> fetchAllUsers(FirebaseUser currentUser) async {
    List<User> userList = List<User>();

    QuerySnapshot querySnapshot =
    await firestore.collection("users").getDocuments();
    for (var i = 0; i < querySnapshot.documents.length; i++) {
      if (querySnapshot.documents[i].documentID != currentUser.uid) {
        userList.add(User.fromMap(querySnapshot.documents[i].data));
      }
    }
    return userList;
  }

  Future<void> addMessageToDb(
      Message message, User sender, User receiver) async {
    var map = message.toMap();

    await firestore
        .collection("messages")
        .document(message.senderId)
        .collection(message.receiverId)
        .add(map);

    return await firestore
        .collection("messages")
        .document(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }
}