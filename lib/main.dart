import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_week10/providers/product_provider.dart';
import 'package:mobile_week10/providers/stok_provider.dart';
import 'package:mobile_week10/screens/products.dart';
import 'package:mobile_week10/screens/stoks.dart';
import 'package:mobile_week10/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductProvider()),
            StreamProvider(create: (context)=> firestoreService.getProducts()),
            ChangeNotifierProvider(create: (context) => StokProvider()),
            StreamProvider(create: (context)=> firestoreService.getStoks()),
          ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
