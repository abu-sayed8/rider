import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  static const String idScreen="home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home',textAlign: TextAlign.center,),),
      body: Center(
        child: Text('This is home page'),
      ),
    );
  }
}
