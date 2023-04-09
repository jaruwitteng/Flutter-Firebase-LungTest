import 'package:flutter/material.dart';
import './edu_data.dart';
import './edu_page.dart';

void main() {
  runApp(UniversityList());
}

class UniversityList extends StatefulWidget {
  const UniversityList({Key? key}) : super(key: key);

  @override
  _UniversityListState createState() => _UniversityListState();
}

class _UniversityListState extends State<UniversityList> {
  static List<String> universityname = [
    'Exercises for lung',
    "Food for good lung",
    "Yoga for lung"
  ];
  static List url = [
    "https://www.byrdie.com/thmb/rGML"
        "QaJ4h017t41cJVomMLGhMkA=/750x0/filters"
        ":no_upscale():max_bytes(150000)"
        ":strip_icc():format(webp)/GettyImages-96"
        "10132861-0fd889bb88bb4602a2ccce448a58eb97.jpg",
    "https://thumbs.dreamstime.com/z/"
        "food-lung-health-nutrients-vitamins"
        "-antioxidants-cherry-tomatoes-peppers"
        "-broccoli-cauliflower-nuts-garlic-appl"
        "e-cranberry-161419933.jpg",
    "https://media.istockphoto.com/vectors/woman-me"
        "ditating-in-nature-and-leaves-concept-illust"
        "ration-for-yoga-vector-id1220813328?s=612x612",
  ];
  static List<String> universityDesc = [
    "1. Diaphragmatic breathing Diaphragmatic breathing, or “belly breathing,”"
        " engages the diaphragm, which is supposed to do most of the heavy lif"
        "ting when it comes to breathing. This technique is particularly helpful "
        "in people with COPD, as the diaphragm isn’t as effective in these individua"
        "ls and could be strengthened. The technique best used when feeling rested.",
    'https://md.kku.ac.th/',
    'https://arch.kku.ac.th/web/'
  ];
  static List<String> credit = [
    'วิศวกรรมศาสตร์',
    'เเพทยศาสตร์',
    'สถาปัตยกรรมศาสตร์'
  ];

  final List<UniversityStoreData> universityData = List.generate(
      universityname.length,
      (index) => UniversityStoreData(universityname[index], '${url[index]}',
          '${universityDesc[index]}', credit[index]));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: universityData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UniversityPage(
                          universityStoreData: universityData[index],
                        )));
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  DecoratedBox(
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
                                        universityData[index].name,
                                        style: TextStyle(
                                            fontFamily: 'Fredoka One',
                                            fontSize: 25),
                                      ))),
                                  Container(
                                    child: Container(
                                        width: 380,
                                        height: 380,
                                        padding: const EdgeInsets.all(8),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40)),
                                            child: Image.network(
                                              universityData[index].imageUrl,
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
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Stat(),
            //     ));
          },
          elevation: 25,
          hoverColor: Colors.redAccent,
          label: const Text(
            'Back to main menu',
            style: TextStyle(fontFamily: 'Fredoka One', fontSize: 15),
          ),
          backgroundColor: const Color.fromRGBO(56, 163, 165, 1),
        ),
      ),
    );
  }
}
