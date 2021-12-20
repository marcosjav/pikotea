import 'package:flutter/material.dart';
import 'package:pikotea/ui/first_page.dart';
import 'package:pikotea/ui/second_page.dart';
import 'package:pikotea/ui/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pikotea',
      initialRoute: FirstPage.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        FirstPage.routeName: (_) => const FirstPage(),
        SecondPage.routeName: (_) => SecondPage(),
        ThirdPage.routeName: (_) => const ThirdPage(),
      },
    );
  }
}
