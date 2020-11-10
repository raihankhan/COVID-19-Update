
import 'package:covid_19_tracker_app/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.brown[900],
    ),
    home: Homepage(),
  ));
}
