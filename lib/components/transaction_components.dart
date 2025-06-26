import 'package:flutter/material.dart';
import 'package:lea_pay/utils/constants.dart';

class TransactionListItem extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final VoidCallback onTap;

  const TransactionListItem({
    super.key,
    required this.transaction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final amount = double.parse(transaction['price'] as String);
    final isCredit = transaction['type'] == 'credit';
    final amountColor = isCredit ? Colors.green : Colors.black;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kSpacingLarge),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: kLightGreyColor, width: 1.0),
                color: Colors.white,
                borderRadius:
                    const BorderRadius.all(Radius.circular(kRadiusMedium)),
              ),
              child: Image.asset(transaction['logo']!,
                  height: kIconSizeMedium, width: kIconSizeMedium),
            ),
            const SizedBox(width: kSpacingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction['vendor']!,
                    style: const TextStyle(
                        fontSize: kFontSizeSmall, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: kSpacingTiny),
                  Text(
                    transaction['time']!,
                    style: const TextStyle(
                        fontSize: kFontSizeSmall, color: kDarkGreyColor),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${isCredit ? '+' : '-'}\$${amount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: kFontSizeSmall,
                      fontWeight: FontWeight.bold,
                      color: amountColor),
                ),
                const SizedBox(height: kSpacingSmall),
                if (transaction['points'].isNotEmpty)
                  LeaPoints(myPoints: transaction['points']),
              ],
            ),
          ],
        ),
      ),
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
          color: kSecondaryColor, borderRadius: BorderRadius.circular(20)),
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
