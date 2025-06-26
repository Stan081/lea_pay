import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lea_pay/components/general_components.dart';
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

class MoreForYouSection extends StatelessWidget {
  const MoreForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: kSpacingSmall,
          mainAxisSpacing: kSpacingSmall,
          childAspectRatio: 1,
          children: const [
            MoreForYouCard(
              icon: 'assets/icons/1.svg',
              iconBackgroundColor: Color(0xffA092E9),
              description: 'View your accounts with other banks',
              title: 'Add accounts',
            ),
            MoreForYouCard(
              icon: 'assets/icons/2.svg',
              iconBackgroundColor: Color(0xffE992C6),
              description: 'Check your credit score and track your progress',
              title: 'Your credit score',
            ),
            MoreForYouCard(
              icon: 'assets/icons/3.svg',
              iconBackgroundColor: Color(0xffE9B692),
              description: 'Take advantage of all the travel services we offer',
              title: 'Travel',
            ),
            MoreForYouCard(
              icon: 'assets/icons/4.svg',
              iconBackgroundColor: Color(0xff92E9D4),
              description: 'Get rewards, cashback, benefits and more',
              title: 'More money in your pocket',
            ),
          ],
        ),
      ],
    );
  }
}

class MoreForYouCard extends StatelessWidget {
  final String icon;
  final Color iconBackgroundColor;
  final String description;
  final String title;

  const MoreForYouCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacingMedium),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kRadiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(kRadiusMedium),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          // const SizedBox(height: kSpacingSmall)
          Text(
            description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: (kFontSizeExtraSmall + 2),
            ),
          ),
          const SizedBox(height: kSpacingSmall),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: (kFontSizeExtraSmall + 2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
