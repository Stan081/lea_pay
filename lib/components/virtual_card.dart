import 'package:flutter/material.dart';

class VirtualCard extends StatelessWidget {
  final bool isSelected;
  const VirtualCard({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: isSelected ? 350 : 330,
            height: isSelected ? 200 : 180,
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
