import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Stats'),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 10,
                        offset: Offset(0, 10)),
                  ]),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              countryData[index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              countryData[index]['countryInfo']['flag'],
                              height: 50,
                              width: 60,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'CONFIRMED:' +
                                  countryData[index]['cases']
                                      .toString()
                                      .replaceAllMapped(
                                          new RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => "${m[1]},"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[300]),
                            ),
                            Text(
                              'DETECTED TODAY:' +
                                  countryData[index]['todayCases']
                                      .toString()
                                      .replaceAllMapped(
                                          new RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => "${m[1]},"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[200]),
                            ),
                            Text(
                              'STILL INFECTED:' +
                                  countryData[index]['active']
                                      .toString()
                                      .replaceAllMapped(
                                          new RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => "${m[1]},"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[300]),
                            ),
                            Text(
                              'RECOVERED:' +
                                  countryData[index]['recovered']
                                      .toString()
                                      .replaceAllMapped(
                                          new RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => "${m[1]},"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[300]),
                            ),
                            Text(
                              'DEATHS:' +
                                  countryData[index]['deaths']
                                      .toString()
                                      .replaceAllMapped(
                                          new RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => "${m[1]},"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[200]),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
