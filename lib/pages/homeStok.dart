import 'package:flutter/material.dart';

class HomeStok extends StatefulWidget {
  HomeStok(HomeStok);

  @override
  HomeStokState createState() => HomeStokState();
}

class HomeStokState extends State<HomeStok> {
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
