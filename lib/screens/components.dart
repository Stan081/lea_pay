import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transactions.dart';
import 'package:lea_pay/utils/contants.dart';

class Components extends StatefulWidget {
  const Components({super.key});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseAppComponent(
        showBottomNavBar: true,
        appBar: const NavigatorAppBar(
          header: 'Transactions',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                              fontSize: subheadingFontSize),
                        ),
                        Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                              fontSize: subheadingFontSize),
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
                              fontSize: subheadingFontSize),
                        ),
                        Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                              fontSize: subheadingFontSize),
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
                      vendor: 'Spotify',
                      logo: 'assets/icons/spotify.png',
                      price: '23.85',
                      time: '07:47 PM',
                      points: '0',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
