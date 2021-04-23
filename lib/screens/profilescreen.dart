import 'package:ecommerce_app/widgets/myButton.dart';
import 'package:ecommerce_app/widgets/notification_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildSingleContainer(String startText, String endText) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startText,
              style: TextStyle(fontSize: 17, color: Colors.black45),
            ),
            Text(
              endText,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTextFormField({String name}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          NotificationButton(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 65,
                        backgroundImage: AssetImage("images/profile.jpg"),
                      ),
                    ],
                  ),
                ),
                edit == true ? Padding(
                  padding: const EdgeInsets.only(left: 225, top: 80),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.edit, color: Colors.black),
                    ),
                  ),
                ) : Container(),
              ],
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                   height: 300,
                   child: edit == true ? Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                        _buildSingleTextFormField(name: "Angela James"),
                        _buildSingleTextFormField(name: "AngelaJames@gmail.com"),
                       _buildSingleTextFormField(name: "Female"),
                        _buildSingleTextFormField(name: "09088856789"),
                     ],
                   ): Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                      _buildSingleContainer("Name", "Angela James"),
                  _buildSingleContainer("Email", "AngelaJames@gmail.com"),
                  _buildSingleContainer("Gender", "Male"),
                  _buildSingleContainer("Phone Number", "0903456237"),
                   ],
                 ),
                 ),
                 
                  
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 200,
                child: MyButton(
                  name: "Edit Profile",
                  onPressed: () {
                    se
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
