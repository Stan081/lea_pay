import 'package:flutter/material.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/screens/login_screen.dart';
import 'package:lea_pay/screens/otp_screen.dart';
import 'package:lea_pay/utils/constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? agreeToTerms = false;
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
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kSpacingHuge, horizontal: kSpacingXXXLarge),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: kSpacingHuge * 2),
                  const Text(
                    "Create Your Account",
                    style: TextStyle(
                        color: Colors.white, fontSize: kFontSizeXXLarge),
                  ),
                  const SizedBox(
                    height: kSpacingLarge,
                  ),
                  const SizedBox(
                    height: kSpacingXLarge,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "surname",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kRadiusMedium)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kSpacingMedium,
                  ),
                  const SizedBox(
                    height: kSpacingXLarge,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "other names",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kRadiusMedium)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kSpacingMedium,
                  ),
                  const SizedBox(
                    height: kSpacingXLarge,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "email",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kRadiusMedium)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kSpacingMedium,
                  ),
                  const SizedBox(
                    height: kSpacingXLarge,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "phone number",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kRadiusMedium)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kSpacingMedium,
                  ),
                  SizedBox(
                    height: kSpacingXLarge,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIconColor: const Color(0xff004D43),
                        suffixIcon: IconButton(
                          iconSize: kIconSizeMedium,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "password",
                        border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kRadiusMedium)),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        // activeColor: Colors.white,
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.black.withAlpha(82);
                          }
                          return Colors.white;
                        }),
                        value: agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            agreeToTerms = value;
                          });
                        },
                      ),
                      const Text(
                        'I agree with Terms and Conditons',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: kSpacingLarge,
                  ),
                  PrimaryButton(
                    text: 'Sign Up',
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: kSpacingMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Color(0xff8E949A), fontSize: kFontSizeSmall),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: kFontSizeLarge),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
