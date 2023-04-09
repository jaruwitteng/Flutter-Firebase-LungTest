import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ListFirebase());
}

class ListFirebase extends StatefulWidget {
  ListFirebase({Key? key}) : super(key: key);
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  State<ListFirebase> createState() => _ListFirebaseState();
}

class _ListFirebaseState extends State<ListFirebase> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.collection('score').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("not found"),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                margin: EdgeInsets.all(8),
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                        document['date'] + "          " + document['time'])),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
