import 'package:flutter/material.dart';
import './edu_data.dart';

class UniversityPage extends StatelessWidget {
  final UniversityStoreData universityStoreData;
  const UniversityPage({Key? key, required this.universityStoreData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Text(
                  universityStoreData.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    universityStoreData.imageUrl,
                    height: 380,
                    width: 380,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 350,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Text(universityStoreData.desc,
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          elevation: 25,
          hoverColor: Colors.redAccent,
          label: const Text(
            'Back',
            style: TextStyle(fontFamily: 'Fredoka One', fontSize: 15),
          ),
          backgroundColor: const Color.fromRGBO(56, 163, 165, 1),
        ));
  }
}
