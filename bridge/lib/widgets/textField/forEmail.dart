import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    Key? key,
    required this.controllerEmail,
  }) : super(key: key);

  final TextEditingController controllerEmail;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerEmail,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          labelText: 'EMAIL',
          contentPadding: EdgeInsets.symmetric(
            vertical: 16, horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          prefixIcon: Icon(Icons.email)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) =>
          email != null && !EmailValidator.validate(email)
              ? 'Enter a valid email'
              : null,
    );
  }
}
