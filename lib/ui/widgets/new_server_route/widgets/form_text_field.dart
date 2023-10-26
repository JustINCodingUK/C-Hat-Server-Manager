import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {

  final String label;
  final TextEditingController controller;

  const FormTextField({required this.label, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              label: Text(label),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ));
  }
}
