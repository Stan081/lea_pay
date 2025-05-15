import 'package:flutter/material.dart';
import 'package:lea_pay/utils/contants.dart';

class PrimaryIconButton extends StatelessWidget {
  final Widget icon;
  final Function action;
  const PrimaryIconButton(
      {super.key, required this.icon, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: icon,
        onPressed: () {
          action();
        },
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
            color: Colors.black,
            size: 25,
          ),
          action: () {},
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function action;
  const PrimaryButton({super.key, required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: extraLargeSpacing,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          action();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            elevation: 20),
        child: Text(
          text,
          style: const TextStyle(color: Color(0xff004D43), fontSize: 15),
        ),
      ),
    );
  }
}
