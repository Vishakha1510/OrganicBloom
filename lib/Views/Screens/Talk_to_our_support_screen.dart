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
        backgroundColor: Colors.blue.shade200,
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
