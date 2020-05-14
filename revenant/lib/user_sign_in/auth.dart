// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:revenant/user_info/user_input.dart';
//
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();
//
// Future<String> signInWithGoogle() async {
//  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//  final GoogleSignInAuthentication googleSignInAuthentication =
//      await googleSignInAccount.authentication;
//
//  final AuthCredential credential = GoogleAuthProvider.getCredential(
//    accessToken: googleSignInAuthentication.accessToken,
//    idToken: googleSignInAuthentication.idToken,
//  );
//
//  final AuthResult authResult = await _auth.signInWithCredential(credential);
//  final FirebaseUser user = authResult.user;
//
//  assert(!user.isAnonymous);
//  assert(await user.getIdToken() != null);
//
//  final FirebaseUser currentUser = await _auth.currentUser();
//  assert(user.uid == currentUser.uid);
//
//  return 'signInWithGoogle succeeded: $user';
// }
//
// void signOutGoogle() async {
//  await googleSignIn.signOut();
//
//  print("User Sign Out");
// }
//
// class Auth extends StatefulWidget {
//  @override
//  _AuthState createState() => _AuthState();
// }
//
// class _AuthState extends State<Auth> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("REVENANT"),
//      ),
//      body: Center(
//        child: ListView(
//          children: <Widget>[
//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                OutlineButton(
//                  color: Colors.blueGrey,
//                  splashColor: Colors.grey,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(40)),
//                  highlightElevation: 0,
//                  borderSide: BorderSide(color: Colors.grey),
//                  child: Padding(
//                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                    child: Row(
//                      mainAxisSize: MainAxisSize.min,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Image(
//                            image: AssetImage("assets/google_logo.png"),
//                            height: 35.0),
//                        Padding(
//                          padding: const EdgeInsets.only(left: 10),
//                          child: Text(
//                            'Sign in with Google',
//                            style: TextStyle(
//                              fontSize: 20,
//                              color: Colors.grey,
//                            ),
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                  onPressed: () {
//                    signInWithGoogle().whenComplete(() {
//                      var signInPageToUserInputScreen = new MaterialPageRoute(
//                          builder: (BuildContext context) => userInput());
//                      Navigator.of(context).push(signInPageToUserInputScreen);
//                    });
//                  },
//                ),
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
// }
//
////import 'dart:async';
////import 'package:firebase_auth/firebase_auth.dart';
////
////abstract class BaseAuth {
////  Future<String> signIn(String email, String password);
////
////  Future<String> signUp(String email, String password);
////
////  Future<FirebaseUser> getCurrentUser();
////
////  Future<void> sendEmailVerification();
////
////  Future<void> signOut();
////
////  Future<bool> isEmailVerified();
////}
////
////class Auth implements BaseAuth {
////  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
////
////  Future<String> signIn(String email, String password) async {
////    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
////        email: email, password: password);
////    FirebaseUser user = result.user;
////    return user.uid;
////  }
////
////  Future<String> signUp(String email, String password) async {
////    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
////        email: email, password: password);
////    FirebaseUser user = result.user;
////    return user.uid;
////  }
////
////  Future<FirebaseUser> getCurrentUser() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    return user;
////  }
////
////  Future<void> signOut() async {
////    return _firebaseAuth.signOut();
////  }
////
////  Future<void> sendEmailVerification() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    user.sendEmailVerification();
////  }
////
////  Future<bool> isEmailVerified() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    return user.isEmailVerified;
////  }
////}
