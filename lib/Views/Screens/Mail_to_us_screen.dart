import 'package:flutter/material.dart';

class MailToUsScreen extends StatefulWidget {
  const MailToUsScreen({super.key});

  @override
  State<MailToUsScreen> createState() => _MailToUsScreenState();
}

class _MailToUsScreenState extends State<MailToUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "MAIL  TO  US",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
