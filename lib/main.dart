import 'package:flutter/material.dart';
import 'package:talks/helper/authenticate.dart';
import 'package:talks/views/chatRoomsScreen.dart';
import 'package:talks/views/conversationScreen.dart';

void main() async{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff000000),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
      ),
      home: ChatRoom(),
      //home: Authenticate(),
    );
  }
}
