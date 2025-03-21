// ignore_for_file: file_names, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmpasswordController;

  bool ispasswordvisible = false;
  bool isconfirmpasswordvisible = false;

  @override
  void initState() {
    super.initState();
    getdetails();
  }

  UserProvider? userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    emailController ??=
        TextEditingController(text: userProvider?.user?.data()["email"]);
    passwordController ??=
        TextEditingController(text: userProvider?.user?.data()["password"]);
    confirmpasswordController ??= TextEditingController(
        text: userProvider?.user?.data()["confirmpassword"]);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFA5CC65),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "EDIT  PROFILE",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: _buildbody());
  }

  Widget _buildbody() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        spacing: 20,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'Enter Email', border: OutlineInputBorder()),
          ),
          TextField(
            controller: passwordController,
            obscureText: !ispasswordvisible,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispasswordvisible = !ispasswordvisible;
                      });
                    },
                    icon: ispasswordvisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off)),
                labelText: 'Enter Password',
                border: OutlineInputBorder()),
          ),
          TextField(
            controller: confirmpasswordController,
            obscureText: !isconfirmpasswordvisible,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isconfirmpasswordvisible = !isconfirmpasswordvisible;
                      });
                    },
                    icon: isconfirmpasswordvisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off)),
                labelText: 'Enter confirm Password',
                border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () {
                updatedetails();
              },
              child: Text("SAVE"))
        ],
      ),
    );
  }

  void getdetails() async {
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection('users');

    DocumentSnapshot documentSnapshot = await userCollection.doc().get();
    if (documentSnapshot.exists) {
      setState(() {
        emailController?.text = documentSnapshot['email'];
        passwordController?.text = documentSnapshot['password'];
      });
    }
  }

  void updatedetails() async {
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    final userid = userprovider.user?.id;
    if (emailController!.text.isEmpty ||
        passwordController!.text.isEmpty ||
        confirmpasswordController!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (passwordController!.text != confirmpasswordController!.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    if (userid != null) {
      FirebaseFirestore.instance.collection('users').doc(userid).update({
        'email': emailController?.text,
        'password': passwordController?.text,
        'confirmpassword': confirmpasswordController?.text
      });
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userid)
            .update({
          'email': emailController!.text,
          'password': passwordController!.text,
          'confirmpassword': confirmpasswordController!.text
        });
        await userProvider!.updateUser(userid, {
          'email': emailController!.text,
          'password': passwordController!.text,
          'confirmpassword': confirmpasswordController!.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully")),
        );

        Navigator.of(context).pop();
      } catch (e) {
        print("Error updating profile: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update profile")),
        );
      }
    }
  }
}
