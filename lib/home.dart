import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "API DEFINE",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
