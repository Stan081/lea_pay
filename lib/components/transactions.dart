import 'package:flutter/material.dart';
import 'package:lea_pay/utils/contants.dart';

class TransactionCard extends StatelessWidget {
  final num? height;
  final Widget content;
  final Widget heading;
  const TransactionCard(
      {super.key, required this.content, required this.heading, this.height});

  @override
  Widget build(BuildContext context) {
    var divisor = height ?? 2;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / divisor,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [heading, content],
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
      child: Flexible(
        flex: 1,
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            time,
            style: const TextStyle(
                fontSize: 16,
                color: Color(0xffA4A9AE),
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
        TransactionDetails(
          vendor: vendor,
          logo: logo,
          price: price,
          time: time,
          points: points,
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
