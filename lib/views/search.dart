import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talks/widgets/widget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 9),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchController,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (values){

                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search Username...",
                          hintStyle: TextStyle(
                            color: Colors.white
                          ),
                          focusColor: Colors.white,
                        ),
                      ),
                  ),
                  Container(
                    height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40)
                      ),
                      padding: EdgeInsets.all(12),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.white,
                        onPressed: (){

                        },
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
