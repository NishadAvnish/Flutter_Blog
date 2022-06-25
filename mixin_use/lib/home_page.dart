import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mixin_use/verification_mixin.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class HomePage extends StatelessWidget with VerificationChecker {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mixin Demo'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
                onTap: () {
                  checkVerificationStatus(() {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("SuccessFully Messaged User")));
                  });
                },
                child: Container(
                    width: 140,
                    height: 50,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text("Message User"))),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  checkVerificationStatus(() {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("You're following this User")));
                  });
                },
                child: Container(
                    width: 140,
                    height: 50,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text("Follow User"))),
          ]),
        ),
      ),
    );
  }
}
