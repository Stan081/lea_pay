import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          SizedBox(
            width: 96,
            height: 100.6,
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  width: 34,
                  height: 34,
                  color: const Color(0xff004D43),
                  icon,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            time,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffA4A9AE)),
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
        height: 110,
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
                    width: 70,
                    height: 70,
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
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vendor,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          time,
                          style: const TextStyle(color: Color(0xffA4A9AE)),
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
                    '\$ $price',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    myPoints,
                    style: const TextStyle(fontSize: 15),
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
