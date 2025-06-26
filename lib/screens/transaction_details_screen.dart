import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/utils/constants.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionDetailsScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final amount = double.parse(transaction['price'] as String);
    final isCredit = transaction['type'] == 'credit';
    final amountColor = isCredit ? Colors.green : Colors.black;

    return Scaffold(
      appBar: CustomAppBar(
        prefix: const BackNavButton(),
        header: 'Transaction Details',
      ),
      body: Padding(
        padding: const EdgeInsets.all(kSpacingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    '${isCredit ? '+' : '-'}\$${amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: kAmountFontSize,
                      fontWeight: FontWeight.bold,
                      color: amountColor,
                    ),
                  ),
                  const SizedBox(height: kSpacingSmall),
                  Text(
                    '${transaction['vendor']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: kSpacingMedium),
                  Chip(
                    label: Text('${transaction['status']}'),
                    backgroundColor: transaction['status'] == 'Completed'
                        ? Colors.green.shade100
                        : Colors.orange.shade100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: kSpacingLarge),
            const Divider(),
            const SizedBox(height: kSpacingLarge),
            _buildDetailRow('Date:', '${transaction['date']}'),
            _buildDetailRow('Time:', '${transaction['time']}'),
            _buildDetailRow('Type:', '${transaction['type']}'),
            if (transaction['points'].isNotEmpty)
              _buildDetailRow('Loyalty Points:', '${transaction['points']}'),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Report an issue'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
