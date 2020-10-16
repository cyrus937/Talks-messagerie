import 'package:flutter/material.dart';
import 'package:talks/helper/authenticate.dart';
import 'package:talks/model/data.dart';
import 'package:talks/services/auth.dart';
import 'package:talks/views/search.dart';
import 'package:talks/widgets/categorieSelector.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods = new AuthMethods();
  DataProvider dataProvider = new DataProvider();

  @override
  /*void initState(){
    super.initState();
    DataProvider.listMessage().then(
            (messageList) => Bloc
    );
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          color: Colors.white,
          onPressed: () {},
        ),*/
        title: Image.asset("assets/images/talks2.png"),
        actions: [
          GestureDetector(
            onTap: () {
              //authMethods.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.search)),
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Cyrus"),
                accountEmail: null,
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("C"),
              ),
            ),
            new Divider(),
            new ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.person,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              title: new Text(
                "Profil",
              ),
            ),
            new Divider(),
            new ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.group_rounded,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              title: new Text(
                "Contacts",
              ),
            ),
            new ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.group_add_rounded,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              title: new Text(
                "Inviter des amis",
              ),
            ),
            new ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.auto_awesome,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              title: new Text(
                "Thèmes",
              ),
            ),
            new ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.not_interested_outlined,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              title: new Text(
                "Liste Noire",
              ),
            ),
            new Divider(),
            new ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.settings,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              title: new Text(
                "Paramètres",
              ),
            ),
            new ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.assistant,
                ),
                color: Colors.black,
                onPressed: () {},
              ),
              title: new Text(
                "Assistance",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message, color: Colors.black),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search()));
        },
      ),
      body: Column(
        children: [
          CategorieSelector(),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
