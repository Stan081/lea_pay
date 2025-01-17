import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lea_pay/screens/components.dart';
import 'package:lea_pay/screens/dashboard_screen.dart';
import 'package:lea_pay/screens/make_payment_screen.dart';
import 'package:lea_pay/utils/contants.dart';

class BaseAppComponent extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;
  final double? paddingTop = 16;
  const BaseAppComponent({super.key, required this.body, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SafeArea(child: body),
        ),
        bottomNavigationBar: const BottomNavigation());
  }
}

class Headings extends StatelessWidget {
  final String text;
  const Headings({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
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
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Components(),
                  ),
                );
              },
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
