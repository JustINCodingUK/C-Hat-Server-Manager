import 'package:flutter/material.dart';

class ProgressAlertDialog extends StatelessWidget {

  final String text;

  const ProgressAlertDialog(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),

            Text(text, style: const TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}