import 'package:flutter/material.dart';
import './stat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebaseList.dart';

void main() {
  Firebase.initializeApp();
  runApp(statver2());
}

class Edu extends StatelessWidget {
  final String name, pic;
  const Edu(this.name, this.pic);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
          decoration: const BoxDecoration(
              color: const Color.fromRGBO(56, 163, 165, 1),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: 30,
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          child: Container(
                              child: Text(
                            name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ))),
                      Container(
                        width: 150,
                      ),
                      Container(
                        child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 60,
                            padding: const EdgeInsets.all(8),
                            child: Container(
                                child: Text(
                              pic,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ))),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class statver2 extends StatelessWidget {
  statver2({Key? key}) : super(key: key);
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My Pet App",
        home: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
          // appBar: AppBar(
          //   title: Text("My Pet App"),
          // ),
          body: ListFirebase(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Stat(),
                  ));
            },
            elevation: 25,
            hoverColor: Colors.redAccent,
            label: const Text('Back to main menu'),
            backgroundColor: const Color.fromRGBO(56, 163, 165, 1),
          ),
        ));
  }
}
