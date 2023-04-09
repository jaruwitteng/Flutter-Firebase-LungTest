import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
              child: Text("Please refresh or do lungtest first"),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return GestureDetector(
                onPanUpdate: (details) async {
                  // await FirebaseFirestore.instance
                  //     .runTransaction((Transaction myTransaction) async {
                  //   await myTransaction
                  //       .delete(snapshot.data!.docs[].reference);
                  // });

                  if (details.delta.dx > 10) {
                    db.collection('score').doc(document.reference.id).delete();
                  }
                  if (details.delta.dx < 10) {
                    db.collection('score').doc(document.reference.id).delete();
                  }
                  // db
                  //     .collection('score')
                  //     .doc(snapshot.data!.docs[1].reference.id)
                  //     .delete();

                  //var snackBar = SnackBar(content: Text(document['date']));
                  //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    document['date'] +
                        "                             " +
                        document['time'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
