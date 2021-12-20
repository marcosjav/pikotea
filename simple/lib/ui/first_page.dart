import 'package:flutter/material.dart';
import 'package:pikotea/ui/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, SecondPage.routeName),
          child: const Text("COMENZAR"),
        ),
      ),
    );
  }
}
