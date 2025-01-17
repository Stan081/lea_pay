import 'package:flutter/material.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/utils/contants.dart';

class WelcomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WelcomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Good Morning, Lea",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome to LeaPay",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      size: 25,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

class NavigatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigatorAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PrimaryIconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                  size: 18,
                ),
                action: () {},
              ),
              const Text(
                'Transactions',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const NotificationButton()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
