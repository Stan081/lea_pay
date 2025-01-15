import 'package:flutter/material.dart';

class VirtualCard extends StatelessWidget {
  const VirtualCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SizedBox(
            width: 320,
            height: 180,
            child: Image.asset(
              scale: 1,
              'assets/illustrations/card.png',
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
