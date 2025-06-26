import 'package:flutter/material.dart';
import 'package:lea_pay/utils/constants.dart';

class PasswordField extends StatefulWidget {
  final Future<bool> Function(BuildContext) authenticate;
  final bool showPassword;
  final ValueChanged<bool> onShowPasswordChanged;

  const PasswordField({
    super.key,
    required this.authenticate,
    required this.showPassword,
    required this.onShowPasswordChanged,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool get showPassword => widget.showPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSpacingXXXLarge,
      child: TextField(
        obscureText: !showPassword,
        decoration: InputDecoration(
          suffixIconColor: const Color(0xff004D43),
          suffixIcon: IconButton(
            iconSize: kIconSizeMedium,
            onPressed: () async {
              if (!showPassword) {
                await widget.authenticate(context);
              }
            },
            icon: const Icon(Icons.fingerprint_outlined),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "password",
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(kRadiusMedium)),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSpacingXXXLarge,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(kRadiusMedium)),
          ),
        ),
      ),
    );
  }
}
