import 'package:flutter/material.dart';

class HomeBuku extends StatefulWidget {
  HomeBuku(HomeBuku);

  @override
  HomeBukuState createState() => HomeBukuState();
}

class HomeBukuState extends State<HomeBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
