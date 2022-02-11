import 'package:firebase_firestoreapp/model/contractor.dart';
import 'package:firebase_firestoreapp/model/service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContractorsPage extends StatefulWidget {
  @override
  _ContractorsPageState createState() => _ContractorsPageState();
}

class _ContractorsPageState extends State<ContractorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contractors List'),
      ),
      body: FutureBuilder<List<Contractor>>(
        future: FirestoreService().readContractorData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        snapshot.data[index].name,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      ),
                      Column(
                        children: [
                          Text(
                            'Hire Rate per hour: ' + snapshot.data[index].price,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            'Rating: ' + snapshot.data[index].rating + '/5',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
