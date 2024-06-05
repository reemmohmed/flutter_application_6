import 'package:flutter/material.dart';

class AppTextFormfield extends StatelessWidget {
  final TextEditingController Controller;
  final String? Function(String?)? validator;
  final String lable;
  const AppTextFormfield(
      {required this.Controller,
      required this.validator,
      required this.lable,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            )),
      ),
    );
  }
}
