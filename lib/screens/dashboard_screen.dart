import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/dashboard_components.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transactions.dart';
import 'package:lea_pay/data/transaction_data.dart';
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
      showBottomNavBar: true,
      appBar: const WelcomeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Image.asset(
                    'assets/illustrations/balance_banner.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20, right: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Total Balance',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          "\$100,000,000",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WalletScreen()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('My Wallet ',
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                Icon(
                                  Icons.arrow_circle_right,
                                  size: 45,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              const TransactionCard(
                heading: Headings(text: 'Quick Actions'),
                content: SingleChildScrollView(
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
                        icon: 'assets/icons/charity.svg',
                        time: 'Gifts',
                      ),
                      QuickActionCards(
                        icon: 'assets/icons/loan.svg',
                        time: 'Charity',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Column(
                  children: [
                    TransactionCard(
                      heading: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Headings(text: 'Transactions'),
                          Text(
                            'See all',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                      content: SizedBox(
                        height: 250,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) => TransactionItem(
                            vendor: transactions[index]['vendor']!,
                            logo: transactions[index]['logo']!,
                            price: transactions[index]['price']!,
                            time: transactions[index]['time']!,
                            points: transactions[index]['points']!,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Headings(text: 'Scheduled Payment'),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View All',
                            style: TextStyle(
                                color: Color(0xffA4A9AE), fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    const PaymentsCards(
                      vendor: 'Netflix',
                      logo: 'assets/icons/netflix.png',
                      price: '10.00',
                      time: '11:00 AM',
                      points: '25',
                    ),
                    const PaymentsCards(
                      vendor: 'Paypal',
                      logo: 'assets/icons/paypal.png',
                      price: '200.00',
                      time: '02:35 PM',
                      points: '10',
                    ),
                    const PaymentsCards(
                      vendor: 'Spotify',
                      logo: 'assets/icons/spotify.png',
                      price: '23.85',
                      time: '07:47 PM',
                      points: null,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
