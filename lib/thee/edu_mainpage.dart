import 'package:flutter/material.dart';
import '../kong/lib/screen/main_screen.dart';
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
    "Food for lung",
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
    'When you are working out your heart and lungs will work harder in order to match'
        ' the demand of oxygen that is being used. So, if you work out regularly it wi'
        'll increase the process of oxygen intake and flow of oxygen in your body. So, '
        'we provide you some basic exercises that can help you improve your lung health.\n\n'
        '1)Aerobic exercises:\n\n'
        ' Light activity like walking, running or jumping rope because you'
        ' will exercise a lot of muscle groups which will help you get a better blood flow and oxygen intake.\n\n'
        '2)Weight lifting:\n\n'
        'Because weight lifting helps you become more efficient at extracting oxygen from your blood. Also will help'
        ' you improve your overall lung function too.',
    'Although nutritions doesn’t impact directly on how much lung strength you will get, but good and healthy food can prevent'
        ' some diseases that can damage and affect your lungs.\n\n'
        '1)Peppers, Guavas, Berry, :\n\n'
        ' Many studies show that from a test group of people who smoke cigarettes that receive vitamin C will have better overall lung function than who doesn’t consume vitamin C.\n\n'
        '2)Beets, :\n\n'
        'Food high in nitrates help boost blood flow, reduce blood pressure and optimize oxygen uptake. '
        'Also can be help in patients that have high blood pressure.',
    ' Main point of yoga is to control the breathing, breathing exercise. So yoga can improve your lung health and come with many other benefits as well.\n\n'
        '1)Bhujangasana (Cobra Pose) :\n\n'
        '   1.1  Lie on the ground facing the ground.\n\n'
        '   1.2  Keep both your hands at the level of your shoulders.\n\n'
        '   1.3  With the help of your palm, lift your body from the torso.\n\n'
        '   1.4  This should stretch your back muscles.\n\n'
        '   1.5  Now straighten your arms and look towards the ceiling.\n\n'
        '   1.6  Hold onto this position for about 20 seconds\n\n'
        '2)Matsyasana (Fish Pose) :\n\n'
        '   1.1  Lie on your back and keep the arms under your lower back.\n\n'
        '   1.2  Lift your upper body and take a deep breath in.\n\n'
        '   1.3  Rest your head on the ground while keeping your back arched.\n\n'
        '   1.4  Use elbows to maintain balance.\n\n'
        '   1.5  Open the chest by inhaling and exhaling deeply.\n\n'
        '   1.6  Hold in this position for as long as you can.\n\n'
  ];
  static List<String> credit = [
    'Credit : Lung.org',
    'Credit : healthline.com',
    'Credit : wellcurve.in'
  ];

  final List<UniversityStoreData> universityData = List.generate(
      universityname.length,
      (index) => UniversityStoreData(universityname[index], '${url[index]}',
          '${universityDesc[index]}', credit[index]));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
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
