import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'jobs_result.dart';

class JobsPage extends StatefulWidget {
  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  final GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
  final TextEditingController _expcontroller = new TextEditingController();
  final TextEditingController _industrycontroller = new TextEditingController();
  final databaseReference = FirebaseDatabase.instance.reference();


  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void updateData(){
    databaseReference.update({
      'Experience' : '${_expcontroller.text}',
      'IndustryOption' : '${_selectedIndustry}'
    });
  }

  List<String> _industry = ['Please Choose an Option ','IT-Software ', 'Education ', 'BPO ', 'Banking ', 'Recruitment ', 'Internet ', 'Pharma ', 'Medical', 'Automobile', 'Construction ']; // Option 2
  String _selectedIndustry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("JOBS/INTERNSHIPS"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              Form(
                key: formkey2,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: _expcontroller,
                        decoration: InputDecoration(
                          labelText: "Enter Your Experience(in years)",
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Your Experience(in years)";
                          } else {
                            //       User.name = value;
                            return "";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
//                      child: TextFormField(
//                        keyboardType: TextInputType.text,
//                        controller: _industrycontroller,
//                        decoration: InputDecoration(
//                          labelText: "Which Industry are you interested in?",
//                          border: OutlineInputBorder(
//                            gapPadding: 3.3,
//                            borderRadius: BorderRadius.circular(3.3),
//                          ),
//                        ),
//                        validator: (value) {
//                          if (value.isEmpty) {
//                            return "Which Industry are you interested in?";
//                          } else {
////                            User.name = value;
//                            return "";
//                          }
//                        },
//                      ),
                      child: DropdownButton(
                          hint: Text('Please choose an industry'), // Not necessary for Option 1
                          value: _selectedIndustry,

                          onChanged: (newValue) {
                            setState(() {
                              _selectedIndustry = newValue;
                            });
                          },
                          items: _industry.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text("SHOW RESULTS"),
                          onPressed: () {
                            var route = new MaterialPageRoute(
                                builder: (BuildContext context) => JobsResult());
                            Navigator.of(context).push(route);
                            getData();
                            updateData();
                          },
                        ),
                        RaisedButton(
                          onPressed: () {
                            _expcontroller.clear();
                            _industrycontroller.clear();
                            _selectedIndustry = _industry[0];
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

