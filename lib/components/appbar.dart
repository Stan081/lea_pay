import 'package:flutter/material.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/utils/constants.dart';

class WelcomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WelcomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                  size: kIconSizeMedium,
                ),
                action: () {
                  Navigator.pop(context);
                },
              ),
            ])
          ]),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kAppBarHeight);
}

class NavigatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String header;
  const NavigatorAppBar({super.key, this.color, required this.header});

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? backgroundColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryIconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: kDarkGreyColor,
                size: kIconSizeSmall,
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
  Size get preferredSize => const Size(double.infinity, kAppBarHeight);
}

class SuffixNavigatorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Color? color;
  final String header;
  final Widget suffix;
  final VoidCallback? action;
  const SuffixNavigatorAppBar(
      {super.key,
      this.color,
      required this.header,
      required this.suffix,
      this.action});

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? backgroundColor;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Container(
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PrimaryIconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: kPrimaryColor,
                  size: kIconSizeSmall,
                ),
                action: action ??
                    () {
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
  Size get preferredSize => const Size(double.infinity, kAppBarHeight);
}

class AppBarSubHeaderText extends StatelessWidget {
  final String text;
  const AppBarSubHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: kFontSizeSmall, color: kDarkGreyColor),
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
      style: const TextStyle(
          fontSize: (kFontSizeSmall + 2),
          fontWeight: FontWeight.bold,
          color: kDarkGreyColor),
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
    return SafeArea(
      child: AppBar(
        backgroundColor: backgroundColor, // Customize background color
        elevation: 0,
        scrolledUnderElevation: 0, // Customize elevation
        leading: prefix ?? const SizedBox(),
        title: Text(
          header ?? '',
          style: const TextStyle(
            color: kDarkGreyColor,
            fontSize: kFontSizeLarge,
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
  Size get preferredSize => const Size(double.infinity, kAppBarHeight);
}
