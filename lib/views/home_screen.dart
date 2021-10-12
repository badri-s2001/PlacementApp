import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:placement_app/components/rounded_button.dart';
import 'package:placement_app/views/experiences_screen.dart';
import 'package:placement_app/views/register_screen.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TypewriterAnimatedTextKit(
              text: const ["Placement App"],
              textStyle: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              speed: const Duration(milliseconds: 200),
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonTitle: "Log In",
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            RoundedButton(
              buttonTitle: "Register",
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            RoundedButton(
              buttonTitle: "Experiences",
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, '/experiences');
              },
            ),
          ],
        ),
      ),
    );
  }
}
