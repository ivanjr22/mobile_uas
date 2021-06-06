import 'package:flutter/material.dart';
import 'package:mobile_week10/login_page.dart';
import 'package:mobile_week10/sign_in.dart';
import 'package:mobile_week10/pages/homeBuku.dart'; 
import 'package:mobile_week10/pages/homeStok.dart'; 

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Title Aplikasi
      title: 'Toko Buku Sarjana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              //AppBar pada aplikasi
              title: Text("Toko Buku Sarjana"),
              
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    //Tab bar pada aplikasi
                    text: "Daftar Buku",
                  ),
                  Tab(
                    //Tab bar pada aplikasi
                    text: "Daftar Stok Buku",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                //Pemanggilan Method dari masing-masing page Home
              HomeBuku(HomeBuku),
              HomeStok(HomeStok),
            ],
          )
        ),
      ),
    );
  }
}