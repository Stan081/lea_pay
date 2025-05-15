import 'package:flutter/material.dart';
import 'package:lea_pay/screens/login_screen.dart';
import 'package:lea_pay/utils/contants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double fontSize = 34;
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
                height: MediaQuery.of(context).size.height / 1.8,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const Text(
                    //   'Manage Your Payments with',
                    //   style: TextStyle(fontSize: 35, color: Colors.white),
                    // ),
                    RichText(
                      textAlign: TextAlign.start,
                      //maxLines: 1,
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Manage Your\nPayments with\n',
                            style: TextStyle(
                                // fontFamily: 'Pally',
                                color: Colors.white,
                                fontSize: fontSize),
                          ),
                          TextSpan(
                            text: 'mobile banking',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize,
                                color: Color(0xffD0FF71)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: largeSpacing,
                    ),
                    Text(
                      'A convenient way to manage yout \nmoney securely from your mobie device',
                      style: TextStyle(
                          fontSize: subheadingFontSize, color: Colors.white),
                    ),
                    SizedBox(
                      height: largeSpacing,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.8,
                        ),
                        SizedBox(
                          height: defaultSpacing,
                          width: (defaultSpacing * 2),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffD0FF71),
                                shadowColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                elevation: 20),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  color: const Color(0xff004D43),
                                  fontSize: subheadingFontSize),
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
