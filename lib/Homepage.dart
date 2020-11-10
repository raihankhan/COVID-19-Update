import 'dart:convert';

import 'package:covid_19_tracker_app/CountryPage.dart';
import 'package:covid_19_tracker_app/DataSource.dart';
import 'package:covid_19_tracker_app/InfoPanel.dart';
import 'package:covid_19_tracker_app/VaccineInfo.dart';
import 'package:covid_19_tracker_app/WorldWidePanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker_app/MostAffectedCountry.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData;
  List countryData;
  fetchWorldWideData() async {
    http.Response response =
        await http.get(DataSource.worldAPI);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchCountryData() async {
    http.Response response = await http
        .get(DataSource.countryAPI);
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'COVID-19 Update',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),

                  child: Text(
                    'WorldWide Info',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Image.network(
                DataSource.worldImage,
              )),
              if (worldData == null)
                CircularProgressIndicator()
              else
                WorldWidePanel(worldData: worldData),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CountryPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 8,
                      ),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(7),
                  margin: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(
                    'View Country Based Info',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VaccineInfo()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 8,
                      ),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(7),
                  margin: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(
                    'View Vaccine Updates',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  'Most Affected Countries',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              if (countryData == null)
                CircularProgressIndicator()
              else
                MostAffectedCountry(countryData: countryData),
              Container(

                  margin: const EdgeInsets.all(10.0),
                  child: Text(
                    'Corona Virus In Bangladesh',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
              ),
              Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Image.network(
                      DataSource.bdImage,
                  )),
              Container(
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                color: Colors.greenAccent[50],
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
              InfoPanel(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}

// https://youtu.be/mOV1aBVYKGA
