import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/dashboard_components.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/virtual_card.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
      appBar: const NavigatorAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.start,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  VirtualCard(),
                  VirtualCard(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Headings(text: 'Transactions'),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/Filter.png'),
                )
              ],
            ),
            const Column(
              children: [
                PaymentsCards(
                  vendor: 'Netflix',
                  logo: 'assets/icons/netflix.png',
                  price: '10.00',
                  time: '11:00',
                  points: '25',
                ),
                PaymentsCards(
                  vendor: 'Spotify',
                  logo: 'assets/icons/spotify.png',
                  price: '23.85',
                  time: '19:47',
                  points: null,
                ),
                PaymentsCards(
                  vendor: 'Paypal',
                  logo: 'assets/icons/paypal.png',
                  price: '200.00',
                  time: '14:35',
                  points: '10',
                ),
                PaymentsCards(
                  vendor: 'Spotify',
                  logo: 'assets/icons/spotify.png',
                  price: '23.85',
                  time: '19:47',
                  points: null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
