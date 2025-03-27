// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/mainnavigation.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  bool ispasswordvisible = false;
  bool isconfirmpasswordvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F5),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                Text(
                  "Enter your credentials to continue",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF595959),
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordcontroller,
                  obscureText: !ispasswordvisible,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispasswordvisible = !ispasswordvisible;
                            });
                          },
                          icon: ispasswordvisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: confirmpasswordcontroller,
                  obscureText: !isconfirmpasswordvisible,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isconfirmpasswordvisible =
                                  !isconfirmpasswordvisible;
                            });
                          },
                          icon: isconfirmpasswordvisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off))),
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: 'By continuing you agree to our',
                    style: TextStyle(fontSize: 14, color: Color(0xFF595959)),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Terms of\nService',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA5CC65),
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA5CC65),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA5CC65),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      createuser();
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1E1E),
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA5CC65),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createuser() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    CollectionReference<Map<String, dynamic>> userCollection =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await userCollection
        .where('email', isEqualTo: emailcontroller.text)
        .get();

    if (passwordcontroller.text != confirmpasswordcontroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(
              child: Text(
            "Passwords do not match",
            style: TextStyle(fontWeight: FontWeight.bold),
          ))));
      return;
    }

    if (querySnapshot.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              "Email already in use",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )));
      return;
    }

    await userCollection.add({
      "email": emailcontroller.text,
      "password": passwordcontroller.text,
    });

    QuerySnapshot<Map<String, dynamic>> newUserSnapshot = await userCollection
        .where('email', isEqualTo: emailcontroller.text)
        .get();

    if (newUserSnapshot.docs.isNotEmpty) {
      userProvider.setUser(newUserSnapshot.docs.first);
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color((0xFFA5CC65)),
        content: Center(
            child: Text(
          "Signup Successful!!!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ))));

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MainNavigationScreen(),
    ));
  }
}
