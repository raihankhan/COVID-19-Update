import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostAffectedCountry extends StatelessWidget {
  final List countryData;

  const MostAffectedCountry({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Image.network(
                      countryData[index]['countryInfo']['flag'],
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      countryData[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Cases: ' +
                          countryData[index]['cases']
                              .toString()
                              .replaceAllMapped(
                                  new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => "${m[1]},") +
                          ' [+' +
                          countryData[index]['todayCases']
                              .toString()
                              .replaceAllMapped(
                                  new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => "${m[1]},") +
                          ']',
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Deaths:' + countryData[index]['deaths'].toString().replaceAllMapped(
                          new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => "${m[1]},"),
                      style: TextStyle(
                          color: Colors.red[200], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
