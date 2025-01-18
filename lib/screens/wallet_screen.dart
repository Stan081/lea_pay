import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/dashboard_components.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transactions.dart';
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
      appBar: const NavigatorAppBar(
        header: 'Wallet',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.start,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    VirtualCard(),
                    VirtualCard(),
                  ],
                ),
              ),
            ),
            TransactionCard(
              heading: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        'Total',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Headings(text: 'October 17, Thu'),
                      Headings(text: '\$234.80'),
                    ],
                  ),
                ],
              ),
              content: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TransactionItem(
                    vendor: 'Netflix',
                    logo: 'assets/icons/netflix.png',
                    price: '10.00',
                    time: '11:00 AM',
                    points: '25',
                  ),
                  TransactionItem(
                    vendor: 'Paypal',
                    logo: 'assets/icons/paypal.png',
                    price: '200.00',
                    time: '02:35 PM',
                    points: '10',
                  ),
                  TransactionItem(
                    vendor: 'Spotify',
                    logo: 'assets/icons/spotify.png',
                    price: '23.85',
                    time: '07:47 PM',
                    points: '0',
                  ),
                  TransactionItem(
                    vendor: 'Spotify',
                    logo: 'assets/icons/spotify.png',
                    price: '23.85',
                    time: '07:47 PM',
                    points: '0',
                  ),
                ],
              ),
            ),
            TransactionCard(
              heading: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        'Total',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Headings(text: 'October 20, Sun'),
                      Headings(text: '\$35.80'),
                    ],
                  ),
                ],
              ),
              content: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TransactionItem(
                    vendor: 'Netflix',
                    logo: 'assets/icons/netflix.png',
                    price: '10.00',
                    time: '11:00 AM',
                    points: '25',
                  ),
                  TransactionItem(
                    vendor: 'Spotify',
                    logo: 'assets/icons/spotify.png',
                    price: '23.85',
                    time: '07:47 PM',
                    points: '0',
                  ),
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
