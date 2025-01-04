import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lea_pay/screens/dashboard_screen.dart';
import 'package:lea_pay/screens/make_payment_screen.dart';

class BaseAppComponent extends StatelessWidget {
  final Widget body;
  const BaseAppComponent({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF3F3F3),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(child: body),
        ),
        bottomNavigationBar: const BottomNavigation());
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.ideographic,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                'assets/icons/1.svg',
                color: const Color(0xff004D43),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/2.svg',
                color: const Color(0xff004D43),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MakePaymentScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                height: 45,
                width: 45,
                'assets/icons/3.svg',
                color: const Color(0xff004D43),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/4.svg',
                color: const Color(0xff004D43),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/5.svg',
                color: const Color(0xff004D43),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
