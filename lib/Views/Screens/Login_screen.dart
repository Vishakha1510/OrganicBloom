import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Signup_screen.dart';
import 'package:organicbloom/Views/Screens/mainnavigation.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool ispasswordvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F5),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Loging",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E1E)),
                ),
                Text(
                  "Enter your email and password",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF595959),
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
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
                            : Icon(Icons.visibility_off),
                      )),
                  obscureText: !ispasswordvisible,
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xFF1E1E1E)),
                    ),
                  ),
                ),
                SizedBox(height: 150),
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
                      loginuser();
                    },
                    child: Text(
                      "LOG IN",
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Signup_screen(),
                    ));
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1E1E),
                        ),
                        children: [
                          TextSpan(
                            text: " Signup",
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

  void loginuser() async {
    CollectionReference<Map<String, dynamic>> userCollection =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await userCollection
        .where('email', isEqualTo: emailController.text)
        .where('password', isEqualTo: passwordController.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      print(querySnapshot.docs.first.data());

      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);

      userProvider.setUser(querySnapshot.docs.first);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login successfull!!!")));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainNavigationScreen(),
      ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Incorrect Email or Password")));
    }
  }
}
