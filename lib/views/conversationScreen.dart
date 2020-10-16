import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talks/modal/message.dart';
import 'package:talks/modal/user.dart';
import 'package:talks/widgets/widget.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  Widget ChatMessageList() {}
  User user = new User(1, "Cyrus", null, null, null);
  //Message sms = new Message(user, null, null, null, 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cyrus',
          style: TextStyle(
            fontSize: 28.0,
            //fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {})
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70.0,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    //_buildMessageComposer(),
                    Container(
                        //padding: EdgeInsets.all(8),
                        child: IconButton(
                          iconSize: 25.0,
                          icon: Icon(Icons.photo),
                          color: Colors.white,
                          onPressed: (){},
                        )
                    ),
                    Container(
                      child: Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: Colors.white),
                              color: Colors.white),
                          child: TextField(
                              //controller: searchController,
                              style: TextStyle(color: Colors.black),
                              textCapitalization: TextCapitalization.sentences,
                              onChanged: (values){

                              },
                              decoration: InputDecoration(
                                  hintText: "Message...",
                                  alignLabelWithHint: true,
                                  prefixText: "   ",
                                  //fillColor: Colors.white,
                                  hintStyle: TextStyle(color: Colors.black),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none)
                              )
                          ),
                        ),
                      ),
                    ),
                    Container(
                        //padding: EdgeInsets.all(8),
                        child: IconButton(
                          iconSize: 25.0,
                          icon: Icon(Icons.send),
                          color: Colors.white,
                          onPressed: (){},
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      //color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.photo),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: () {}),
          Expanded(
              child: TextField(
            decoration: InputDecoration(hintText: 'Send message...'),
          )),
          IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: () {})
        ],
      ),
    );
  }
}
