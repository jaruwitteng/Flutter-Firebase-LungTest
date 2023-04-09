import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lungv2/kong/lib/screen/signin_screen.dart';

import '../../../sang/main.dart';
import '../reuseable_widgets/reuserable_widget.dart';
import '../utils/color_utils.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import '../../../thee/statver2.dart';
import '../../../thee/edu_mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("#155799"),
            hexStringToColor("#159957"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 25),
                    child: SizedBox(
                        child: Stack(
                      children: [
                        Text("Lung Test",
                            style: TextStyle(
                              fontSize: 55,
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w600,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = Colors.black,
                            )),
                        const Text(
                          "Lung Test",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'Fredoka',
                            fontSize: 55,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(252, 150, 159, 1.0),
                          ),
                        )
                      ],
                    ))),
                logoWidget("images/lungs.png"),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LungTest()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 60,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: const Center(
                            child: Text(
                          'Lung Test',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => statver2()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 60,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: const Center(
                            child: Text(
                          'Statistic',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UniversityList()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 60,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: const Center(
                            child: Text(
                          'Education Mode',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut().then((value) {
                          print("Signed out");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: const Center(
                            child: Text(
                          'LOG OUT',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class MainWidget extends StatelessWidget {
  final title, route, width;
  const MainWidget(this.title, this.route, this.width);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FirebaseAuth.instance.signOut().then((value) {
          print(title);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: width,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(90),
        ),
        child: const Center(
            child: Text(
          'LOG OUT',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
