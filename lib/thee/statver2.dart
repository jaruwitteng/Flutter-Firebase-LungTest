import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../kong/lib/screen/main_screen.dart';
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // appBar: AppBar(
          //   title: Text("My Pet App"),
          // ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    child: const Text(
                      'STATISTIC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: const <Widget>[
                  Expanded(
                      child: Text(
                    'Date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Expanded(
                      child: Text(
                    'Time',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
              Expanded(child: ListFirebase()),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            elevation: 25,
            hoverColor: Colors.redAccent,
            label: const Text('Back to main menu'),
            backgroundColor: const Color.fromRGBO(56, 163, 165, 1),
          ),
        ));
  }
}
