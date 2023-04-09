import 'package:flutter/material.dart';
import './statver2.dart';
import './main.dart';
import './stat.dart';

void main() {
  runApp(eduList());
}

class Edu extends StatelessWidget {
  final String name, pic, desc;
  const Edu(this.name, this.pic, this.desc);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: DecoratedBox(
          decoration: const BoxDecoration(
              color: const Color.fromRGBO(56, 163, 165, 1),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 380,
                          height: 60,
                          padding: const EdgeInsets.all(8),
                          child: Container(
                              child: Text(
                            name,
                            style: TextStyle(
                                fontFamily: 'Fredoka One', fontSize: 25),
                          ))),
                      Container(
                        child: Container(
                            width: 380,
                            height: 380,
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                child: Image.network(
                                  pic,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
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

class eduList extends StatelessWidget {
  const eduList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                  GestureDetector(
                    child: const Edu(
                        "Exercises for lung",
                        "https://www.byrdie.com/thmb/rGML"
                            "QaJ4h017t41cJVomMLGhMkA=/750x0/filters"
                            ":no_upscale():max_bytes(150000)"
                            ":strip_icc():format(webp)/GettyImages-96"
                            "10132861-0fd889bb88bb4602a2ccce448a58eb97.jpg",
                        "test"),
                  ),
                  const SizedBox(height: 20.0),
                  const Edu(
                      "Food for good lung",
                      "https://thumbs.dreamstime.com/z/"
                          "food-lung-health-nutrients-vitamins"
                          "-antioxidants-cherry-tomatoes-peppers"
                          "-broccoli-cauliflower-nuts-garlic-appl"
                          "e-cranberry-161419933.jpg",
                      'test'),
                  const SizedBox(height: 20.0),
                  const Edu(
                      "Yoga for better lung",
                      "https://media.istockphoto.com/vectors/woman-me"
                          "ditating-in-nature-and-leaves-concept-illust"
                          "ration-for-yoga-vector-id1220813328?s=612x612",
                      'test'),
                  const SizedBox(height: 20.0),
                ]),
              ],
            )),
          ),
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
            label: const Text(
              'Back to main menu',
              style: TextStyle(fontFamily: 'Fredoka One', fontSize: 15),
            ),
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

// class eduList2 extends StatelessWidget {
//   const eduList2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Exercises for lung',
//             style: TextStyle(fontFamily: 'Fredoka One', fontSize: 15),
//           ),
//           backgroundColor: const Color.fromRGBO(56, 163, 165, 1),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // Container(
//               //   color: const Color.fromRGBO(56, 163, 165, 1),
//               //   width: 300,
//               //   height: 100,
//               //   child: Text(
//               //     "Exercises for lung",
//               //     style: TextStyle(fontFamily: 'Fredoka One', fontSize: 24),
//               //   ),
//               // ),
//               Image.network(
//                 "https://www.byrdie.com/thmb/rGMLQaJ4h017t41cJVomMLGhMkA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-9610132861-0fd889bb88bb4602a2ccce448a58eb97.jpg",
//                 width: 500,
//                 height: 500,
//               ),
//               Text(
//                 "'This screen is not on a final look'",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Aerobic or light exercises can help increase lungs capacity becuase when your heart"
//                 "rate ",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Lorem",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Lorem",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Lorem",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Lorem",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Lorem",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Lorem",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Lorem",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//               Text(
//                 "Lorem",
//                 style: TextStyle(fontFamily: 'Fredoka One', fontSize: 18),
//               ),
//             ],
//           ),
//         ));
//   }
// }
