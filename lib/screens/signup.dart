import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/widgets/changescreen.dart';
import 'package:ecommerce_app/widgets/myButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email;
String password;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    void validation() async {
      final FormState _form = _formKey.currentState;
      await Firebase.initializeApp();
      if (!_form.validate()) {
        try {
          UserCredential result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          print(result.user.uid);
        } on PlatformException catch (e) {
          print(e.message.toString());
          // ignore: deprecated_member_use
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      } else {}
    }

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please fill UserName";
                            } else if (value.length < 6) {
                              return "UserName is Too Short";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            hintText: "UserName",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please fill Email";
                            } else if (!regExp.hasMatch(value)) {
                              return "Email Is Invalid";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                              print(email);
                            });
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                              print(password);
                            });
                          },
                          obscureText: obserText,
                          validator: (value) {
                            if (value == "") {
                              return "Please FIll Password";
                            } else if (value.length < 8) {
                              return "Password is too short";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill Phone Number";
                            } else if (value.length < 11) {
                              return "Phone Number Must Be 11 Digits";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        // ignore: deprecated_member_use
                        MyButton(
                            name: "SignUp",
                            onPressed: () {
                              validation();
                            }),
                        ChangeScreen(
                          name: "Login",
                          whichAccount: "I Have An Account Already",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => Login(),
                              ),
                            );
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
