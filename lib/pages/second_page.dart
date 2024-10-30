import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const String routeName = "/SecondPage";
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Text("this is second page"),
      ),
    );
  }
}
