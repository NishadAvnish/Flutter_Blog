import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:materialwidgets/popscope/pop_scope_screen2.dart';

class PopScopeExamplePage1 extends StatelessWidget {
  const PopScopeExamplePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final bool isAgreed = await _showBackDialog(context) ?? false;
        if (isAgreed) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Page 1")),
        body: Center(
          child: ElevatedButton(
            child: const Text("Go To page 2"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PopScopeExamplePage2()));
            },
          ),
        ),
      ),
    );
  }

  Future<bool?> _showBackDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Nevermind'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}
