import 'package:flutter/material.dart';

class CategorieSelector extends StatefulWidget {
  @override
  _CategorieSelectorState createState() => _CategorieSelectorState();
}

class _CategorieSelectorState extends State<CategorieSelector> {
  int selectedIndex = 1;
  final List<String> categories = [
    'Contacts',
    'Messages',
    'Groups',
    'Configurations'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Colors.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
          itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(categories[index],
              style: TextStyle(
                color: index == selectedIndex ? Colors.white : Colors.white60,
                fontWeight: FontWeight.bold,
                letterSpacing: 1
              ),),
            ),
          );
          }),
    );
  }
}
