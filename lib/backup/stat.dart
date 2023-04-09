import 'package:flutter/material.dart';

void main() {
  runApp(Stat());
}

class Stat extends StatelessWidget {
  const Stat({Key? key}) : super(key: key);

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
          body: SingleChildScrollView(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 50,
                  ),
                ]),
              ],
            )),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Add your onPressed code here!
            },
            elevation: 25,
            hoverColor: Colors.redAccent,
            label: const Text('Back to main menu'),
            backgroundColor: const Color.fromRGBO(56, 163, 165, 1),
          ),
          // bottomNavigationBar: Container(
          //   height: 50,
          //   color: const Color.fromRGBO(56, 163, 165, 1),
          //   child: InkWell(
          //     onTap: () => print('tap on close'),
          //     child: Padding(
          //       padding: EdgeInsets.only(top: 8.0),
          //       child: Column(
          //         children: <Widget>[
          //           Icon(
          //             Icons.close,
          //             color: const Color.fromRGBO(230, 230, 230, 1),
          //           ),
          //           Text('Back to menu'),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ));
  }
}
