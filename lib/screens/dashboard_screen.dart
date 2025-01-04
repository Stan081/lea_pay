import 'package:flutter/material.dart';
import 'package:lea_pay/components/dashboard_components.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/screens/wallet_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person_2_outlined)),
                ),
                const Text(
                  "Welcome Lea",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Stack(
                  children: [
                    Icon(
                      Icons.notifications_none_rounded,
                      size: 35,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(children: [
              SizedBox(
                width: double.infinity,
                height: 160,
                child: Image.asset(
                  'assets/illustrations/balance_banner.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Balance',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Text(
                      "\$100,000,000",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 90,
                left: 240,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WalletScreen()));
                  },
                  child: const Row(
                    children: [
                      Text('My Wallet '),
                      Icon(
                        Icons.arrow_circle_right,
                        size: 45,
                      ),
                    ],
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            const Headings(text: 'Quick Actions'),
            const SizedBox(
              height: 5,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  QuickActionCards(
                    icon: 'assets/icons/recharge.svg',
                    time: 'Bills',
                  ),
                  QuickActionCards(
                    icon: 'assets/icons/charity.svg',
                    time: 'Charity',
                  ),
                  QuickActionCards(
                    icon: 'assets/icons/loan.svg',
                    time: 'Loan',
                  ),
                  QuickActionCards(
                    icon: 'assets/icons/gift.svg',
                    time: 'Gifts',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Headings(text: 'Scheduled Payment'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Color(0xffA4A9AE), fontSize: 16),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: Column(
                children: [
                  PaymentsCards(
                    vendor: 'Netflix',
                    logo: 'assets/icons/netflix.png',
                    price: '10.00',
                    time: '11:00',
                    points: '25',
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
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class Headings extends StatelessWidget {
  final String text;
  const Headings({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
