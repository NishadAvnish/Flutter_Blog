import 'package:flutter/material.dart';

class PopScopeExamplePage2 extends StatelessWidget {
  PopScopeExamplePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page 2"),
          leading: const SizedBox(),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Back"),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
