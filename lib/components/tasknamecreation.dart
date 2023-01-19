import 'package:flutter/material.dart';

class newTaskName extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const newTaskName({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
      ),
      actions: [
        MaterialButton(
          onPressed: onSave ,
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green,
        ),
        MaterialButton(
          onPressed: onCancel,
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red,
        ),
      ],
    );
  }

}
