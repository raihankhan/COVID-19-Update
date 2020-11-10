import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3),
        children: <Widget>[
          StatusPanel(
            title: 'TOTAL INFECTED',
            panelColor: Colors.lightBlueAccent[100],
            textColor: Colors.blueGrey,
            count: worldData['cases'].toString().replaceAllMapped(
                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => "${m[1]},"),
          ),
          StatusPanel(
            title: 'STILL INFECTED',
            panelColor: Colors.teal[100],
            textColor: Colors.teal,
            count: worldData['active'].toString().replaceAllMapped(
                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => "${m[1]},"),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.greenAccent[100],
            textColor: Colors.green,
            count: worldData['recovered'].toString().replaceAllMapped(
                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => "${m[1]},"),
          ),
          StatusPanel(
            title: 'TOTAL DEATHS',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldData['deaths'].toString().replaceAllMapped(
                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => "${m[1]},"),
          ),
          StatusPanel(
            title: 'RECOVERED TODAY',
            panelColor: Colors.indigo[100],
            textColor: Colors.indigo,
            count: worldData['todayCases'].toString().replaceAllMapped(
                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => "${m[1]},"),
          ),
          StatusPanel(
            title: 'DIED TODAY',
            panelColor: Colors.deepPurple[100],
            textColor: Colors.purple,
            count: worldData['todayDeaths'].toString().replaceAllMapped(
                new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => "${m[1]},"),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
        ],
      ),
    );
  }
}
