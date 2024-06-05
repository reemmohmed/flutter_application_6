import 'package:flutter/material.dart';

class AppElevatedButtn extends StatelessWidget {
  final void Function()? onPressed;
  final String lable;
  const AppElevatedButtn(
      {required this.onPressed, required this.lable, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
            fixedSize: const Size(double.maxFinite, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white),
        onPressed: onPressed,
        child: Text(lable));
  }
}
