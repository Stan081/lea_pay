import 'package:flutter/material.dart';
import 'package:lea_pay/screens/transaction_details_screen.dart';
import 'package:lea_pay/utils/contants.dart';

class TransactionCard extends StatelessWidget {
  final num? height;
  final Widget content;
  final Widget heading;
  final double? horizontalPadding;
  const TransactionCard(
      {super.key,
      required this.content,
      required this.heading,
      this.height,
      this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    var horizontal = horizontalPadding ?? 16;
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Padding(
          padding:
              EdgeInsets.only(top: 16, bottom: 16, left: 16, right: horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: heading,
              ),
              content
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionDetails extends StatelessWidget {
  final String logo;
  final String price;
  final String time;
  final String vendor;
  final String? points;
  const TransactionDetails(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VendorLogo(logo: logo),
              TransactionVendor(vendor: vendor, time: time),
            ],
          ),
          TransactionValues(price: price, myPoints: myPoints),
        ],
      ),
    );
  }
}

class TransactionValues extends StatelessWidget {
  const TransactionValues({
    super.key,
    required this.price,
    required this.myPoints,
  });

  final String price;
  final String myPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$$price',
          style: TextStyle(
              fontSize: subheadingFontSize, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: tinySpacing,
        ),
        LeaPoints(myPoints: myPoints),
      ],
    );
  }
}

class LeaPoints extends StatelessWidget {
  const LeaPoints({
    super.key,
    required this.myPoints,
  });

  final String myPoints;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Text(
          '$myPoints LP',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class VendorLogo extends StatelessWidget {
  const VendorLogo({
    super.key,
    required this.logo,
  });

  final String logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[100]!, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          fit: BoxFit.fill,
          logo,
        ),
      ),
    );
  }
}

class TransactionVendor extends StatelessWidget {
  const TransactionVendor({
    super.key,
    required this.vendor,
    required this.time,
  });

  final String vendor;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            vendor,
            style: TextStyle(
                fontSize: subheadingFontSize, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: smallSpacing,
          ),
          Text(
            time,
            style: TextStyle(
                fontSize: bodyFontSize,
                color: const Color(0xffA4A9AE),
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String vendor;
  final String logo;
  final String price;
  final String time;
  final String points;
  const TransactionItem(
      {super.key,
      required this.vendor,
      required this.logo,
      required this.price,
      required this.time,
      required this.points});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TransactionDetailsScreen(),
              ),
            );
          },
          child: TransactionDetails(
            vendor: vendor,
            logo: logo,
            price: price,
            time: time,
            points: points,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Divider(
            height: 1,
            color: Colors.grey[100],
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
