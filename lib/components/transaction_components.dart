import 'package:flutter/material.dart';
import 'package:lea_pay/utils/constants.dart';
import 'package:sizer/sizer.dart';

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
        padding: EdgeInsets.only(bottom: 2.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: kLightGreyColor, width: 1.0),
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(12.sp)),
              ),
              child: Image.asset(transaction['logo']!,
                  height: 5.h, width: 10.w),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction['vendor']!,
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    transaction['time']!,
                    style: TextStyle(
                        fontSize: 10.sp, color: kDarkGreyColor),
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
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: amountColor),
                ),
                SizedBox(height: 1.h),
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
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        child: Text(
          '$myPoints LP',
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
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
    var horizontal = horizontalPadding ?? 4.w;
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp), color: Colors.white),
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(4.w, 2.h, horizontal, 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
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
