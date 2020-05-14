import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCreators extends StatefulWidget {
  @override
  _AboutCreatorsState createState() => _AboutCreatorsState();
}

class _AboutCreatorsState extends State<AboutCreators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: new Text(
          "About Creators",
          style: new TextStyle(
              fontSize: 26.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(3.0, 4.0, 3.0, 2.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 4.75,
              child: Card(
                color : Colors.grey,
                child: InkWell(
                    splashColor: Colors.black87,
                    child: new ListTile(
//                      leading: CircleAvatar(
//                          child: new Text(
//                            'D',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 22.0),
//                          ),
//                          backgroundColor: Colors.black87),
                      title: Text('Devansh Baldwa',
                          style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic)),
                      subtitle: Text(
                        "Github : devansh03 , LinkedIn : devansh-baldwa-401953178 , Contribution : AppDev and Firebase Linking",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      trailing: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 44,
                          minWidth: 44,
                          maxHeight: 64,
                          maxWidth: 64,
                        ),
                        child: Image.asset(
                          'images/devansh_revenant.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () => _launchDevanshGitHub()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(3.0, 4.0, 3.0, 2.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 4.75,
              child: Card(
                color : Colors.grey,
                child: InkWell(
                    splashColor: Colors.black87,
                    child: new ListTile(
//                      leading: CircleAvatar(
//                          child: new Text(
//                            'D',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 22.0),
//                          ),
//                          backgroundColor: Colors.black87),
                      title: Text('Dipam Goswami',
                          style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic)),
                      subtitle: Text(
                        "Github : dipamgoswami , LinkedIn : dipam-goswami-0a424416b , Contribution : Recommendation Model",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      trailing: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 44,
                          minWidth: 44,
                          maxHeight: 64,
                          maxWidth: 64,
                        ),
                        child: Image.asset(
                          'images/Graduate.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () => _launchDevanshGitHub()),
              ),
            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.fromLTRB(3.0, 4.0, 3.0, 2.0),
//            child: Container(
//              height: MediaQuery.of(context).size.height / 4.75,
//              child: Card(
//                color : Colors.grey,
//                child: InkWell(
//                    splashColor: Colors.black87,
//                    child: new ListTile(
////                      leading: CircleAvatar(
////                          child: new Text(
////                            'D',
////                            style: TextStyle(
////                                color: Colors.white,
////                                fontWeight: FontWeight.bold,
////                                fontSize: 22.0),
////                          ),
////                          backgroundColor: Colors.black87),
//                      title: Text('Dipam Goswami',
//                          style: TextStyle(
//                              fontSize: 26.0,
//                              fontWeight: FontWeight.w700,
//                              fontStyle: FontStyle.italic)),
//                      subtitle: Text(
//                        "Github : singhsuryansh12 , LinkedIn :  , Contribution : Recommendation Model",
//                        style: TextStyle(fontSize: 20.0),
//                      ),
//                      trailing: ConstrainedBox(
//                        constraints: BoxConstraints(
//                          minHeight: 44,
//                          minWidth: 44,
//                          maxHeight: 64,
//                          maxWidth: 64,
//                        ),
//                        child: Image.asset(
//                          'images/devansh_revenant.png',
//                          fit: BoxFit.cover,
//                        ),
//                      ),
//                    ),
//                    onTap: () => _launchDevanshGitHub()),
//              ),
//            ),
        )
        ]),
      ),
    );
  }
}

_launchDevanshGitHub() async {
  const url = 'https://github.com/devansh03';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}
