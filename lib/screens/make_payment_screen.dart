import 'package:flutter/material.dart';
import 'package:lea_pay/utils/contants.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen({super.key});

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreen();
}

class _MakePaymentScreen extends State<MakePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: (defaultSpacing * 2),
        height: (defaultSpacing * 2),
      ),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.cancel_outlined),
      ),
    );
  }
}
