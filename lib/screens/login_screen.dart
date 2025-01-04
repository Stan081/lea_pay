import 'package:flutter/material.dart';
import 'package:lea_pay/screens/dashboard_screen.dart';
import 'package:lea_pay/screens/signup_screen.dart';
import 'package:lea_pay/utils/authenticator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;
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
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Login to Your Account",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                const SizedBox(
                  height: 35,
                ),
                const SizedBox(
                  height: 63,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 63,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIconColor: const Color(0xff004D43),
                      suffixIcon: IconButton(
                        iconSize: 30,
                        onPressed: () async {
                          if (showPassword == false) {
                            showPassword = await authenticate(context);
                            !showPassword
                                ? print('hello')
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                          } else {
                            print('not authenticated');
                          }
                        },
                        icon: const Icon(
                          Icons.fingerprint_outlined,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "password",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
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
                  height: 30,
                ),
                SizedBox(
                  height: 63,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
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
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Color(0xff004D43), fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont have an account?",
                      style: TextStyle(color: Color(0xff8E949A), fontSize: 14),
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
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
