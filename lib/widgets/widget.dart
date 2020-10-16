import 'package:flutter/material.dart';
import 'package:talks/views/infos.dart';
import 'package:talks/views/signin.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.info_outline),
      color: Colors.white,
      onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Infos()));
      },
    ),
    title: Image.asset("assets/images/talks2.png", height: 170),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      prefixIcon: hintText == "email" ? Icon(Icons.mail, color: Colors.white,) : Icon(Icons.person_pin, color: Colors.white,),
      hintStyle: TextStyle(color: Colors.white),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide.none),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide.none));
}

InputDecoration passWordInputDecoration(String hintText, bool showPassword) {
  return InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(Icons.lock, color: Colors.white,),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.remove_red_eye,
          color: showPassword ? Colors.white : Colors.grey,
        ),
        onPressed: () {
          showPassword = ! showPassword;
        },
      ),
      hintStyle: TextStyle(color: Colors.white),
      focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide.none),
      enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide.none)
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle simpleTextStyles() {
  return TextStyle(color: Colors.white, fontSize: 17);
}
