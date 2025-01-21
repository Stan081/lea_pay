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
                  AppBarHeaderText(
                    text: "Good Morning, Lea",
                  ),
                  AppBarSubHeaderText(text: "Welcome to LeaPay"),
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
  final Color? color;
  final String header;
  const NavigatorAppBar({super.key, this.color, required this.header});

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? backgroundColor;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: color,
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
              AppBarHeaderText(text: header),
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

class SuffixNavigatorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Color? color;
  final String header;
  final Widget suffix;
  const SuffixNavigatorAppBar(
      {super.key, this.color, required this.header, required this.suffix});

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? backgroundColor;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: color,
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
                action: () {
                  Navigator.pop(
                    context,
                  );
                },
              ),
              AppBarHeaderText(text: header),
              suffix
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

class StaticAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget header;
  const StaticAppBar({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: 50,
          color: backgroundColor,
          child: Center(child: Center(child: header))),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

class AppBarSubHeaderText extends StatelessWidget {
  final String text;
  const AppBarSubHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
    );
  }
}

class AppBarHeaderText extends StatelessWidget {
  final String text;
  const AppBarHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
