// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TalkToOurSupportScreen extends StatefulWidget {
  const TalkToOurSupportScreen({super.key});

  @override
  State<TalkToOurSupportScreen> createState() => _TalkToOurSupportScreenState();
}

class _TalkToOurSupportScreenState extends State<TalkToOurSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA5CC65),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "TALK  TO  OUR  SUPPORT",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
