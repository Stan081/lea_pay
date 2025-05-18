import 'package:flutter/material.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/utils/contants.dart';

class WelcomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WelcomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: AppBar(
          leadingWidth: double.infinity,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: backgroundColor,
          leading: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBarHeaderText(
                text: "Good Morning, Lea",
              ),
              AppBarSubHeaderText(text: "Welcome to LeaPay"),
            ],
          ),
          actions: [
            Stack(children: [
              PrimaryIconButton(
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 25,
                ),
                action: () {
                  Navigator.pop(context);
                },
              ),
              // Container(
              //   width: 45,
              //   height: 45,
              //   decoration: BoxDecoration(
              //       border: Border.all(),
              //       borderRadius: BorderRadius.circular(12)),
              //   child: const Icon(
              //     Icons.notifications_none_rounded,
              //     size: 20,
              //   ),
              // ),
            ])
          ]),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class NavigatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String header;
  const NavigatorAppBar({super.key, this.color, required this.header});

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? backgroundColor;
    return Padding(
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
                Navigator.pop(context);
              },
            ),
            AppBarHeaderText(text: header),
            const NotificationButton()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class SuffixNavigatorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Color? color;
  final String header;
  final Widget suffix;
  final Function action;
  const SuffixNavigatorAppBar(
      {super.key,
      this.color,
      required this.header,
      required this.suffix,
      required this.action});

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
                  Navigator.pop(context);
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
  Size get preferredSize => const Size(double.infinity, 60);
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
      style: TextStyle(fontSize: subheadingFontSize, color: Colors.black54),
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
      style: TextStyle(fontSize: headingFontSize, fontWeight: FontWeight.bold),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? prefix; // Optional prefix widget (e.g., back button)
  final String? header; // Text for the header
  final Widget? suffix; // Optional suffix widget (e.g., close button)

  const CustomAppBar({
    super.key,
    this.prefix,
    this.header,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        backgroundColor: backgroundColor, // Customize background color
        elevation: 0,
        scrolledUnderElevation: 0, // Customize elevation
        leading: prefix ?? const SizedBox(),
        // IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Text(
          header ?? '',
          style: TextStyle(
            color: Colors.black,
            fontSize: headingFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          if (suffix != null) suffix!,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
