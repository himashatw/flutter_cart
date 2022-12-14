import 'package:flutter/material.dart';
import 'package:lab_three/providers/cart_provider.dart';
import 'package:lab_three/screens/home.dart';
import 'package:lab_three/screens/shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => CartProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: Home.routeName,
        routes: {
          Home.routeName: (context) => Home(),
          Shop.routeName: (context) => Shop(),
        },
      ),
    );
  }
}
