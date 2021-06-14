import 'package:flutter/material.dart';
import 'package:mobile_week10/login_page.dart';
import 'package:mobile_week10/screens/stoks.dart';
import 'package:mobile_week10/sign_in.dart';
import 'package:mobile_week10/screens/products.dart';
import 'package:mobile_week10/about_page.dart';
import 'package:mobile_week10/first_screen.dart';

class AboutPage extends StatefulWidget {
  AboutPage(AboutPage);

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
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
            ),
            drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      'Selamat Datang ' + name ,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      email,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (_) => FirstScreen());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (_) => AboutPage(AboutPage));
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
        ),
      ),
    );
  }
}