import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Checks if a user is authenticated and performs biometric or PIN authentication.
  Future<bool> authenticateUser(BuildContext context) async {
    // Ensure the context is still valid before proceeding.
    if (!context.mounted) return false;

    try {
      // Check if biometric authentication is supported
      bool isBiometricSupported = await _localAuth.isDeviceSupported();
      bool hasBiometrics = await _localAuth.canCheckBiometrics;

      // If biometrics are available, use them
      if (isBiometricSupported && hasBiometrics) {
        bool isAuthenticated = await _localAuth.authenticate(
          localizedReason: 'Authenticate to access this feature.',
          options: const AuthenticationOptions(
            biometricOnly: true, // Use biometrics only
            stickyAuth: true, // Keeps the authentication active
          ),
        );

        if (isAuthenticated) {
          return true;
        }
      }

      // Fallback to PIN authentication if biometrics are unavailable
      return await _authenticateWithPin(context);
    } catch (e) {
      // Silently handle errors, or use a logging framework.
      return false;
    }
  }

  /// PIN-based fallback authentication
  Future<bool> _authenticateWithPin(BuildContext context) async {
    if (!context.mounted) return false;
    final TextEditingController pinController = TextEditingController();

    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Enter PIN"),
              content: TextField(
                controller: pinController,
                decoration: const InputDecoration(
                  labelText: "PIN",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                obscureText: true, // Mask input
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(false), // Cancel action
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    // Validate PIN
                    if (pinController.text == "1234") {
                      // Replace with your validation logic
                      Navigator.of(context).pop(true);
                    } else {
                      Navigator.of(context).pop(false);
                    }
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        ) ??
        false; // Default to false if dialog is dismissed
  }
}

Future<bool> authenticate(BuildContext context) async {
  BiometricAuthService biometricAuthService = BiometricAuthService();

  bool isAuthenticated = await biometricAuthService.authenticateUser(context);
  return isAuthenticated;
}
