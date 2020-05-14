import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MSCollegeResult extends StatefulWidget {
  @override
  _MSCollegeResultState createState() => _MSCollegeResultState();
}

class _MSCollegeResultState extends State<MSCollegeResult> {

  final databaseReference = FirebaseDatabase.instance.reference();

  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void updateData(){
    databaseReference.update({

    });
  }

  void deleteData(){
    databaseReference.child('1').remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text("MS in USA"),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 50.0,),
              Text("YOUR CHANCES OF GETTING SELECTED FOR MS IN USA ARE: "),
              SizedBox(height: 30.0,),
            ],
          ),
        )
      )
    );
  }
}
