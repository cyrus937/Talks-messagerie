import 'package:flutter/material.dart';
import 'package:talks/model/data.dart';
import 'package:talks/widgets/widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'chatRoomsScreen.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  //static bool _showPassword = false;

  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  DataProvider userProvider = new DataProvider();

  TextEditingController userEmail = new TextEditingController();
  TextEditingController userPassword = new TextEditingController();

  bool _showPassword = true;

  void _togglePasswordStatus() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  signMeIn() {

    if (formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      if (userProvider.getUser(userEmail.text, userPassword.text) != null) {
        print(DataProvider.correctInformation);
        //UserProvider.correctInformation = false;
        Fluttertoast.showToast(msg: "Bon retour !!");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //bool _showPassword = false ;
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
        child: Center(child: CircularProgressIndicator()),
      ) : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 150,
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  //padding: EdgeInsets.symmetric(vertical: 40),
                  height: 40,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox.fromSize(
                  size: Size.fromHeight(50),
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextFormField(
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Please Provide a valid email";
                            },
                            controller: userEmail,
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration(
                              "email",
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox.fromSize(
                  size: Size.fromHeight(12),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white)),
                  child: TextFormField(
                    validator: (val) {
                      return val.length > 4
                          ? null
                          : "Please Provide password with 4+ character";
                    },
                    controller: userPassword,
                    cursorHeight: 25,
                    style: simpleTextStyle(),
                    decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: _showPassword ? Colors.white : Colors.grey,
                          ),
                          onPressed: _togglePasswordStatus,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                    obscureText: _showPassword,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Forget Password ?",
                      style: simpleTextStyle(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    signMeIn();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xffFFFFFF),
                          const Color(0xffFFFFF9)
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ? ", style: simpleTextStyles()),
                    GestureDetector(
                      onTap: () {
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Register now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                decoration: TextDecoration.underline)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
