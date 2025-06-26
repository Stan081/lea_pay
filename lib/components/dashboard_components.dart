import 'package:flutter/material.dart';
import 'package:lea_pay/utils/constants.dart';

class QuickActionCards extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback? onTap;

  const QuickActionCards({
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
        padding: const EdgeInsets.symmetric(horizontal: kSpacingSmall),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[500]!),
                  borderRadius: BorderRadius.circular(kRadiusMedium)),
              width: 55, // Keep custom size
              height: 55, // Keep custom size
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: icon),
                ],
              ),
            ),
            const SizedBox(
              height: kSpacingExtraSmall,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: kFontSizeSmall,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentsCards extends StatelessWidget {
  final String logo;
  final String price;
  final String time;
  final String vendor;
  final String? points;
  const PaymentsCards(
      {super.key,
      required this.logo,
      required this.price,
      required this.time,
      required this.vendor,
      this.points});

  @override
  Widget build(BuildContext context) {
    var myPoints = points != null ? '+$points' : '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacingSmall),
      child: Container(
        width: double.infinity,
        height: 100, // Keep custom size
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(kRadiusSmall))),
        child: Padding(
          padding: const EdgeInsets.all(kSpacingMedium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: kSpacingXLarge,
                    height: kSpacingXLarge,
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kRadiusMedium),
                      ),
                      child: Image.asset(
                        fit: BoxFit.fill,
                        logo,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: kSpacingSmall),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          vendor,
                          style: const TextStyle(
                              fontSize: kFontSizeMedium,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: kSpacingExtraSmall,
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                              fontSize: kFontSizeLarge,
                              color: Color(0xffA4A9AE)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$$price',
                    style: const TextStyle(
                        fontSize: kFontSizeLarge, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    myPoints,
                    style: const TextStyle(
                        fontSize: kFontSizeMedium, color: Colors.black38),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
