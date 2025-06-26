import 'package:flutter/material.dart';
import 'package:lea_pay/utils/constants.dart';

class PrimaryIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? action;
  const PrimaryIconButton({super.key, required this.icon, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kIconButtonSize,
      height: kIconButtonSize,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: kLightGreyColor),
        borderRadius: BorderRadius.circular(kSpacingSmall),
      ),
      child: IconButton(
        icon: icon,
        onPressed: action,
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PrimaryIconButton(
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: kPrimaryColor,
            size: kSpacingXXLarge,
          ),
          action: () {},
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? action;
  const PrimaryButton({super.key, required this.text, this.action});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kButtonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          backgroundColor: kSecondaryColor,
          disabledBackgroundColor: kSecondaryColor.withAlpha(128),
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kRadiusMedium)),
          ),
          elevation: 20,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: action != null
                ? kButtonTextColor
                : kButtonTextColor.withAlpha(179),
            fontSize: kFontSizeSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BackNavButton extends StatelessWidget {
  final VoidCallback? action;
  const BackNavButton({
    super.key,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacingSmall),
      child: PrimaryIconButton(
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white,
          size: kFontSizeSmall,
        ),
        action: action ??
            () {
              Navigator.pop(context);
            },
      ),
    );
  }
}
