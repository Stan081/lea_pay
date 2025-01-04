import 'package:flutter/material.dart';
import 'package:lea_pay/components/dashboard_components.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/screens/dashboard_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
      body: SingleChildScrollView(
        child: Column(
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
            // const SizedBox(
            //   height: 20,
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            scale: 1.1,
                            'assets/illustrations/card.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          scale: 1.1,
                          'assets/illustrations/card.png',
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  ],
                ),
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
