import 'package:covid_19_tracker_app/DataSource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VaccineInfo extends StatefulWidget {
  @override
  _VaccineInfoState createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {
  Map<String, dynamic> vaccineData;

  fetchVaccineData() async {
    http.Response response =
    await http.get(DataSource.vaccineAPI);
    setState(() {
      vaccineData = json.decode(response.body);
    });
    print('VaccineData Called');
  }

  @override
  void initState() {
    fetchVaccineData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Updates'),
      ),
      body:
      vaccineData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Candidate : ' +  vaccineData['data'][0]['candidate'] , textAlign: TextAlign.left, style: TextStyle(fontSize: 22, color: Colors.green[700], fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('sponsors : \n' + vaccineData['data'][0]['sponsors'][0] , textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('trialPhase : ' + vaccineData['data'][0]['trialPhase'], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('institutions : \n' + vaccineData['data'][0]['institutions'][0] + vaccineData['data'][0]['institutions'][1], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Details : ', style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(vaccineData['data'][0]['details'], textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Candidate : ' +  vaccineData['data'][1]['candidate'] , textAlign: TextAlign.left, style: TextStyle(fontSize: 22, color: Colors.green[700], fontWeight: FontWeight.bold), ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('sponsors : \n' + vaccineData['data'][1]['sponsors'][0] +vaccineData['data'][1]['sponsors'][1]+vaccineData['data'][1]['sponsors'][2]+vaccineData['data'][1]['sponsors'][3], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('trialPhase : ' + vaccineData['data'][1]['trialPhase'], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('institutions : \n' + vaccineData['data'][1]['institutions'][0]+vaccineData['data'][1]['institutions'][1], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Details : ', style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(vaccineData['data'][1]['details'], textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Candidate : ' +  vaccineData['data'][2]['candidate'] , textAlign: TextAlign.left, style: TextStyle(fontSize: 22, color: Colors.green[700], fontWeight: FontWeight.bold), ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('sponsors : \n' + vaccineData['data'][2]['sponsors'][0] , textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('trialPhase : ' + vaccineData['data'][2]['trialPhase'], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('institutions : \n' + vaccineData['data'][2]['institutions'][0], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Details : ', style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(vaccineData['data'][2]['details'], textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Candidate : ' +  vaccineData['data'][3]['candidate'] , textAlign: TextAlign.left, style: TextStyle(fontSize: 22, color: Colors.green[700], fontWeight: FontWeight.bold), ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('sponsors : \n' + vaccineData['data'][3]['sponsors'][0] , textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('trialPhase : ' + vaccineData['data'][3]['trialPhase'], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('institutions : \n' + vaccineData['data'][3]['institutions'][0], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Details : ', style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(vaccineData['data'][3]['details'], textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Candidate : ' +  vaccineData['data'][19]['candidate'] , textAlign: TextAlign.left, style: TextStyle(fontSize: 22, color: Colors.green[700], fontWeight: FontWeight.bold), ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('sponsors : \n' + vaccineData['data'][19]['sponsors'][0] , textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('trialPhase : ' + vaccineData['data'][19]['trialPhase'], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('institutions : \n' + vaccineData['data'][19]['institutions'][0], textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Details : ', style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(vaccineData['data'][19]['details'], textAlign: TextAlign.justify, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}