import 'package:flutter/material.dart';
import 'package:lea_pay/utils/contants.dart';

class VirtualCard extends StatelessWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final bool isSelected;

  const VirtualCard({
    super.key,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: isSelected ? 370 : 320,
        height: isSelected ? 210 : 160,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/illustrations/card.png', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Card details
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardHolderName,
                        style: TextStyle(
                          fontSize: headingFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        cardNumber.replaceAllMapped(
                            RegExp(r".{4}"), (match) => "${match.group(0)} "),
                        style: TextStyle(
                          fontSize: subheadingFontSize,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Exp: $expiryDate',
                            style: TextStyle(
                              fontSize: bodyFontSize,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'CVV: $cvv',
                            style: TextStyle(
                              fontSize: bodyFontSize,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                              offset: const Offset(0, 3), // Shadow offset
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
                              offset: const Offset(0, 3), // Shadow offset
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
                              offset: const Offset(0, 3), // Shadow offset
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
