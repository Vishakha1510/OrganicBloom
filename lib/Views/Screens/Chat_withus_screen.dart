import 'package:flutter/material.dart';

class ChatWithusScreen extends StatefulWidget {
  const ChatWithusScreen({super.key});

  @override
  State<ChatWithusScreen> createState() => _ChatWithusScreenState();
}

class _ChatWithusScreenState extends State<ChatWithusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "CHAT  WITH  US",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
