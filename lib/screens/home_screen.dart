import 'package:flutter/material.dart';
import 'package:lea_pay/screens/dispatcher_screen.dart';
import 'package:lea_pay/screens/login_screen.dart';
import 'package:lea_pay/screens/onboarding/onboarding_screen.dart';
import 'package:lea_pay/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/illustrations/login-bkg.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.9,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSpacingXLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Manage Your\nPayments with\n',
                            style: TextStyle(
                                color: Colors.white, fontSize: kFontSizeXLarge),
                          ),
                          TextSpan(
                            text: 'mobile banking',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: kFontSizeXXLarge,
                                color: Color(0xffD0FF71)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kSpacingXXLarge,
                    ),
                    const Text(
                      'A convenient way to manage your \nmoney securely from your mobile device',
                      style: TextStyle(
                          fontSize: kFontSizeMedium, color: Colors.white),
                    ),
                    const SizedBox(
                      height: kSpacingXLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.9,
                        ),
                        SizedBox(
                          height: kSpacingXXXLarge,
                          width: (kSpacingXXXLarge * 2),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const OnboardingScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kSecondaryColor,
                                shadowColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(kRadiusMedium))),
                                elevation: 20),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: kFontSizeSmall),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
