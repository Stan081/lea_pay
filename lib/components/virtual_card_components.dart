import 'package:flutter/material.dart';
import 'package:lea_pay/utils/contants.dart';

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
            width: isSelected ? 360 : 320,
            height: isSelected ? 210 : 160,
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

class VirtualCardActions extends StatelessWidget {
  const VirtualCardActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
          width: double.infinity,
          height: 160,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Colors.white, // Background color for the circle
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 6, // Blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(
                            8), // Padding inside the circle
                        child: const Icon(
                          Icons.remove_red_eye,
                          size: 30,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: tinySpacing),
                      Text(
                        'View Card',
                        style: TextStyle(
                          fontSize: bodyFontSize,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Colors.white, // Background color for the circle
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 6, // Blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(
                            8), // Padding inside the circle
                        child: const Icon(
                          Icons.remove_red_eye,
                          size: 30,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: tinySpacing),
                      Text(
                        'View Card',
                        style: TextStyle(
                          fontSize: bodyFontSize,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Colors.white, // Background color for the circle
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              blurRadius: 6, // Blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(
                            8), // Padding inside the circle
                        child: const Icon(
                          Icons.remove_red_eye,
                          size: 30,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: tinySpacing),
                      Text(
                        'View Card',
                        style: TextStyle(
                          fontSize: bodyFontSize,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
