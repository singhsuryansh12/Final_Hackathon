import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class JobsResult extends StatefulWidget {
  @override
  _JobsResultState createState() => _JobsResultState();
}

class _JobsResultState extends State<JobsResult> {

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
        title: Text("JOBS and INTERNSHIPS"),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 100.0,),
              Text("THE COMPANIES WHICH YOU CAN LOOK FORWARD TO JOIN ON THE BASIS OF YOUR SKILLS AND INTERESTS ARE: "),
              SizedBox(height: 15.0,),

            ],
          ),
        ),
      ),
    );
  }
}
