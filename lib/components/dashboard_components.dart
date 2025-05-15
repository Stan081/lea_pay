import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lea_pay/utils/contants.dart';

class QuickActionCards extends StatelessWidget {
  final String icon;
  final String time;

  const QuickActionCards({
    super.key,
    required this.icon,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[500]!),
                borderRadius: BorderRadius.circular(16)),
            width: 90,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      width: 34,
                      height: 34,
                      icon,
                    ),
                  ),
                  SizedBox(
                    height: tinySpacing,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: bodyFontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: extraLargeSpacing,
                    height: extraLargeSpacing,
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        fit: BoxFit.fill,
                        logo,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          vendor,
                          style: TextStyle(
                              fontSize: headingFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: tinySpacing,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: headingFontSize,
                              color: const Color(0xffA4A9AE)),
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
                    style: TextStyle(
                        fontSize: headingFontSize, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    myPoints,
                    style: TextStyle(
                        fontSize: subheadingFontSize, color: Colors.black38),
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
