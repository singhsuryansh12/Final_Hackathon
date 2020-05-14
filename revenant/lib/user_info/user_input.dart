import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:revenant/options_for_user/options.dart';
import 'package:documents_picker/documents_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'about_creators.dart';
class userInput extends StatefulWidget {
  @override
  _userInputState createState() => _userInputState();
}

class _User {
  String email = '';
  String number = '';
  String resume = '';
}

class _userInputState extends State<userInput> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = new TextEditingController();
  final TextEditingController _numbercontroller = new TextEditingController();
  final databaseReference = FirebaseDatabase.instance.reference();
//  File file = await FilePicker.getFile();
  File sampleImage;
  Future getImage() async {
    var tempImage = await FilePicker.getFile(type: FileType.CUSTOM, fileExtension: 'pdf');
    setState(() {
      sampleImage = tempImage;
    });
  }

//  final StorageReference storageRef = FirebaseStorage.instance.ref().child(fileName);

//
//  List<String> docPaths;
//  void _getDocuments() async {
////    docPaths = await DocumentsPicker.pickDocuments;
//    String filePath;
//    filePath = await FilePicker.getFilePath(type: FileType.CUSTOM, fileExtension: 'pdf');
//    debugPrint("$filePath");
//  }

  _User _data = new _User();
  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void updateData(){
    databaseReference.update({
      'Email': '${_emailcontroller.text}',
      'Number': '${_numbercontroller.text}',
    });
  }

  void deleteData(){
    databaseReference.child('1').remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Your Path To Success :)"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                 MaterialPageRoute homeToAboutCreator = MaterialPageRoute(
                     builder: (BuildContext context) => AboutCreators());
                 Navigator.of(context).push(homeToAboutCreator);
              })
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Image.asset("images/interview_pic.png"),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          labelText: "Enter Your Email",
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        onSaved: (val) => _data.number = val,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Enter Your Email";
                          } else {
                            _data.email = val;
                            debugPrint("${_data.email}");
                            return "";
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: _numbercontroller,
                        maxLength: 10,
                        decoration: InputDecoration(
                          labelText: "Enter Your Number",
                          border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius: BorderRadius.circular(3.3),
                          ),
                        ),
                        onSaved: (value) => _data.number = value,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Your Number";
                          } else {
                            _data.number = value;
                            debugPrint("Number : ${_data.number}");
                            return "";
                          }
                        },
                      ),
                    ),

                    SizedBox(
                      height: 15.0,
                    ),
                    RaisedButton(
                      onPressed: getImage,
                      child: Text("Upload Your LinkedIn Resume"),
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
//                    if (docPaths != null)
//                      Text(docPaths.join('\n')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text("PROCEED"),
                          onPressed: () {
                            var fromUserInputToOptions = new MaterialPageRoute(
                                builder: (BuildContext context) => Options());
                            Navigator.of(context).push(fromUserInputToOptions);
//                            createRecord();
                            final StorageReference storageRef = FirebaseStorage.instance.ref().child('sampleImage');
                            final StorageUploadTask task = storageRef.putFile(sampleImage);
                            getData();
                            updateData();

                          },
                        ),
                        RaisedButton(
                          onPressed: () {
                            _emailcontroller.clear();
                            _numbercontroller.clear();
                          },
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text("CANCEL"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Image.asset("images/graduation_pic.png"),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

