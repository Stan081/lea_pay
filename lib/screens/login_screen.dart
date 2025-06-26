import 'package:flutter/material.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/components/textfields.dart';
import 'package:lea_pay/screens/dashboard_screen.dart';
import 'package:lea_pay/screens/dispatcher_screen.dart';
import 'package:lea_pay/screens/signup_screen.dart';
import 'package:lea_pay/utils/authenticator.dart';
import 'package:lea_pay/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;

  Future<bool> _authenticateUser(BuildContext context) async {
    bool isAuthenticated = await authenticate(context);
    if (isAuthenticated) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/illustrations/login-bkg.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSpacingXLarge),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Login to Your Account",
                  style:
                      TextStyle(color: Colors.white, fontSize: kFontSizeXLarge),
                ),
                const SizedBox(
                  height: kSpacingLarge,
                ),
                const CustomTextField(hintText: 'username'),
                const SizedBox(
                  height: kSpacingMedium,
                ),
                PasswordField(
                  authenticate: _authenticateUser,
                  showPassword: showPassword,
                  onShowPasswordChanged: (value) {
                    setState(() {
                      showPassword = value;
                    });
                  },
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            // activeColor: Colors.white,
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors.black.withOpacity(.32);
                              }
                              return Colors.white;
                            }),
                            value: showPassword,
                            onChanged: (value) {
                              setState(() {
                                showPassword = value!;
                              });
                            },
                          ),
                          const Text(
                            'show password',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('forgot details?'),
                      ),
                    ]),
                const SizedBox(
                  height: kSpacingLarge,
                ),
                PrimaryButton(
                  text: 'Login',
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: kSpacingLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Color(0xff8E949A), fontSize: kFontSizeSmall),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: kFontSizeSmall),
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    if (mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DispatcherScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: const Text('Reset Onboarding (for testing)'),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
