import 'package:flutter/material.dart';
import 'package:revenant/jobs_page/jobs.dart';
import 'package:revenant/ms_page/mscolleges.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Text(
          "CHOOSE YOUR INTEREST",
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/hire_me.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: ListTile(
                  title: Text("Jobs/Internships",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40.0),),
                  onTap: () {
                    var jobToAvailableJobs = new MaterialPageRoute(
                        builder: (BuildContext context) => JobsPage());
                    Navigator.of(context).push(jobToAvailableJobs);
                  },
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/study_abroad.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: ListTile(
                  title: Text("MS in USA",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40.0),),
                  onTap: () {
                    var msOptToMSPage = new MaterialPageRoute(
                        builder: (BuildContext context) => MsColleges());
                    Navigator.of(context).push(msOptToMSPage);
                  },
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}
