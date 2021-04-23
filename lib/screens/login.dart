import 'package:ecommerce_app/screens/signup.dart';
import 'package:ecommerce_app/widgets/changescreen.dart';
import 'package:ecommerce_app/widgets/myButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
String email;
String password;
void validation() async {
  final FormState _form = _formKey.currentState;
  if (!_form.validate()) {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(result.user.uid);
    } on PlatformException catch (e) {
      // ignore: deprecated_member_use
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  } else {
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                    onChanged: (value) {
                            setState(() {
                              email = value;
                              print(email);
                            });
                          },
                      validator: (value) {
                        if (value == "") {
                          return "Please Fill Email";
                        } else if (!regExp.hasMatch(value)) {
                          return "Email Is Invalid";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    TextFormField(
                      onChanged: (value) {
                            setState(() {
                              password = value;
                              print(email);
                            });
                          },
                      obscureText: obserText,
                      validator: (value) {
                        if (value == "") {
                          return "Please Fill Password";
                        } else if (value.length < 8) {
                          return "Password is Too Short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                obserText = !obserText;
                              });
                            },
                            child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black),
                          ),
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    // ignore: deprecated_member_use
                    //Button
                    MyButton(
                      onPressed: () {
                        validation();
                      },
                      name: "Login ",
                    ),
                    ChangeScreen(
                      name: "Sign Up",
                      whichAccount: "I Have No Account !",
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => SignUp(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
