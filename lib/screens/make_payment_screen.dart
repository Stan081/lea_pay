import 'package:flutter/material.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen({super.key});

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreen();
}

class _MakePaymentScreen extends State<MakePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox(
        width: 100,
        height: 100,
      ),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.cancel_outlined),
      ),
    );
  }
}
