import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'mscolleges_result.dart';

class MsColleges extends StatefulWidget {
  @override
  _MsCollegesState createState() => _MsCollegesState();
}

class _MsCollegesState extends State<MsColleges> {
  final GlobalKey<FormState> formkey3 = GlobalKey<FormState>();
  final TextEditingController _GREcontroller = new TextEditingController();
  final TextEditingController _TOEFLcontroller = new TextEditingController();
  final TextEditingController _Universityconroller = new TextEditingController();
  final TextEditingController _SOPcontroller = new TextEditingController();
  final TextEditingController _LORcontroller = new TextEditingController();
  final TextEditingController _Expcontroller = new TextEditingController();
  final databaseReference = FirebaseDatabase.instance.reference();

  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void updateData(){
    databaseReference.update({
      'ExpResearch': '${_Expcontroller.text}',
      'LOR': '${_LORcontroller.text}',
      'TOEFLScore': '${_TOEFLcontroller.text}',
      'GREScore': '${_GREcontroller.text}',
      'CurrUniv': '${_Universityconroller.text}',
      'SOP': '${_SOPcontroller.text}',
    });
  }

  void deleteData(){
    databaseReference.child('1').remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("PostGraduation in USA"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              Form(
                key: formkey3,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: _GREcontroller,
                        decoration: InputDecoration(
                          labelText: "GRE Score (Out of 340)",
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "GRE Score (Out of 340)";
                          } else {
                            //       User.name = value;
                            return "";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _TOEFLcontroller,
                        decoration: InputDecoration(
                          labelText: "TOEFL Score (Out of 120)",
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "TOEFL Score (Out of 120)";
                          } else {
//                            User.name = value;
                            return "";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _Universityconroller,
                        decoration: InputDecoration(
                          labelText: "Your Current University's Rating (Out of 5)",
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Your Current University's Rating (Out of 5)";
                          } else {
//                            User.name = value;
                            return "";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _SOPcontroller,
                        decoration: InputDecoration(
                          labelText: "Rate Your Statement Of Purpose(SOP) (Out of 5)",
                          labelStyle: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Rate Your Statement Of Purpose(SOP) (Out of 5)";
                          } else {
//                            User.name = value;
                            return "";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _LORcontroller,
                        decoration: InputDecoration(
                          labelText: "Rate Your Letter Of Recommendation(LOR) (Out of 5)",
                          labelStyle: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Rate Your Letter Of Recommendation(LOR) (Out of 5)";
                          } else {
//                            User.name = value;
                            return "";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _Expcontroller,
                        decoration: InputDecoration(
                          labelText: "Prior Experience In Research (0 for No & 1 for Yes)",
                          labelStyle: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Do You Have Prior Experience In Research (0 for No & 1 for Yes)";
                          } else {
//                            User.name = value;
                            return "";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 15.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text("SHOW MY CHANCES"),
                          onPressed: () {
                            var route = new MaterialPageRoute(
                                builder: (BuildContext context) => MSCollegeResult());
                            Navigator.of(context).push(route);
                            getData();
                            updateData();
                          },
                        ),
                        RaisedButton(
                          onPressed: () {
                            _Expcontroller.clear();
                            _GREcontroller.clear();
                            _LORcontroller.clear();
                            _SOPcontroller.clear();
                            _TOEFLcontroller.clear();
                            _Universityconroller.clear();
                          },
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text("CANCEL"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





//GRE SCORE
//
//TOEFL SCORE
//
//UNIVERSITY RATING
//
//HOW WOULD RATE YOU STATEMENT OF PURPOSE (SOP)
//
//HOW WOULD YOU RATE UR LETTER OF RECOMMENDATION (LOR)
//
//CGPA
//
//DO YOU HAVE PRIOR EXPERIENCE IN RESEARCH

