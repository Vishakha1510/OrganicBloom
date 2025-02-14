import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro_screen extends StatefulWidget {
  const Intro_screen({super.key});

  @override
  State<Intro_screen> createState() => _Intro_screenState();
}

class _Intro_screenState extends State<Intro_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F5),
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 300,
                child: Image(image: AssetImage('assets/logo.png'))),
            Text("ORGANIC\n          BLOOM",
                style: GoogleFonts.rubikBubbles(
                    fontSize: 40, color: Color((0xFFA5CC65)))),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('login');
                },
                child: Text("Get Started -->"))
          ],
        ),
      ),
    );
  }
}
