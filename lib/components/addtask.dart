import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final Function()? onPressed;


  const AddTaskButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        child: Icon(Icons.add),
    );
  }


}