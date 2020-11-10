import 'package:flutter/material.dart';
import 'package:covid_19_tracker_app/DataSource.dart';

class DevelopersInfo extends StatefulWidget {
  @override
  _DevelopersInfoState createState() => _DevelopersInfoState();
}

class _DevelopersInfoState extends State<DevelopersInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer's Info"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          DataSource.developersInfo,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
