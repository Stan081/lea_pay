import 'package:flutter/material.dart';
import 'package:lea_pay/components/onboarding_components.dart';
import 'package:lea_pay/utils/constants.dart';

class SetPasswordPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const SetPasswordPage({super.key, required this.formKey});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kSpacingMedium),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set your password',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: kSpacingSmall),
            Text(
              'Create a secure password for your account.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: kSpacingLarge),
            OnboardingTextField(
              labelText: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: kSpacingMedium),
            OnboardingTextField(
              labelText: 'Confirm Password',
              controller: _confirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
