import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextfieldPassword extends StatelessWidget {
  const TextfieldPassword({
    Key? key,
    required this.controllerPassword,
  }) : super(key: key);

  final TextEditingController controllerPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerPassword,
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
          labelText: 'PASSWORD',
          contentPadding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
          )),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length < 6 ? 'Enter min. 6 Characcters' : null,
    );
  }
}
