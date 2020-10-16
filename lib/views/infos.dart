import 'package:flutter/material.dart';

class Infos extends StatefulWidget {
  @override
  _InfosState createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      )
    );
  }
}
