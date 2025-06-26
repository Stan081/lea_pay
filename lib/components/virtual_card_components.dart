import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lea_pay/utils/constants.dart';

class VirtualCard extends StatelessWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String balance;
  final bool isSelected;
  final bool isFrozen;
  final bool showDetails;

  const VirtualCard({
    super.key,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.balance,
    required this.isSelected,
    this.isFrozen = false,
    this.showDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    final maskedCardNumber = '**** **** **** ****';
    final maskedExpiryDate = '**/**';
    final maskedCvv = '***';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      width: isSelected ? 360 : 365,
      height: isSelected ? 210 : 160,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/illustrations/card.png',
                fit: BoxFit.fill,
                color: isFrozen ? Colors.grey : null,
                colorBlendMode: isFrozen ? BlendMode.saturation : null,
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
                    Colors.black.withAlpha(80),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cardHolderName,
                          style: const TextStyle(
                            fontSize: kFontSizeMedium,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$$balance',
                          style: const TextStyle(
                            fontSize: kFontSizeLarge,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      showDetails
                          ? cardNumber.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} ")
                          : maskedCardNumber,
                      style: const TextStyle(
                        fontSize: kFontSizeMedium,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          showDetails
                              ? 'Exp: $expiryDate'
                              : 'Exp: $maskedExpiryDate',
                          style: const TextStyle(
                            fontSize: kFontSizeMedium,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          showDetails ? 'CVV: $cvv' : 'CVV: $maskedCvv',
                          style: const TextStyle(
                            fontSize: kFontSizeMedium,
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
    );
  }
}

class VirtualCardActionsSection extends StatelessWidget {
  final VoidCallback onAddMoney;
  final VoidCallback onFreeze;
  final VoidCallback onViewDetails;
  final bool isFrozen;
  final bool showDetails;

  const VirtualCardActionsSection({
    super.key,
    required this.onAddMoney,
    required this.onFreeze,
    required this.onViewDetails,
    required this.isFrozen,
    required this.showDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CardActions(
            icon: SvgPicture.asset('assets/icons/recharge.svg', height: 25),
            text: "Add Money",
            onTap: onAddMoney,
          ),
          CardActions(
            icon: Icon(isFrozen ? Icons.lock_open : Icons.lock, size: 25),
            text: isFrozen ? "Unfreeze" : "Freeze",
            onTap: onFreeze,
          ),
          CardActions(
            icon: Icon(showDetails ? Icons.visibility_off : Icons.visibility,
                size: 25),
            text: showDetails ? "Hide Details" : "Show Details",
            onTap: onViewDetails,
          ),
        ],
      ),
    );
  }
}

class CardActions extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback? onTap;

  const CardActions({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(51),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: icon,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: kFontSizeMedium,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
