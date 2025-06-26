import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/dashboard_components.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transaction_components.dart';
import 'package:lea_pay/screens/transaction_details_screen.dart';
import 'package:lea_pay/screens/transactions_screen.dart';
import 'package:lea_pay/data/transaction_data.dart';
import 'package:lea_pay/screens/bank_transfer_screen.dart';
// import 'package:lea_pay/screens/wallet_screen.dart';
import 'package:lea_pay/screens/new_wallet_screen.dart';
import 'package:lea_pay/utils/constants.dart';

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
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Image.asset(
                      'assets/illustrations/balance_banner.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kSpacingLarge),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Total Balance',
                          style: TextStyle(
                              fontSize: kFontSizeMedium, color: Colors.white),
                        ),
                        const FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            "\$3,000",
                            style: TextStyle(
                                fontSize: (kFontSizeExtraLarge),
                                // fontFamily: 'Pally',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: kSpacingSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 const WalletScreen()));
                            //   },
                            //   child: const Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [
                            //       Text('My Wallet ',
                            //           style: TextStyle(
                            //             fontSize: kFontSizeSmall,
                            //           )),
                            //       Icon(
                            //         Icons.arrow_circle_right,
                            //         size: kIconSizeLarge,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NewWalletScreen()));
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('New Wallet ',
                                      style: TextStyle(
                                        fontSize: kFontSizeSmall,
                                      )),
                                  Icon(
                                    Icons.arrow_circle_right,
                                    size: kIconSizeLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: kSpacingSmall,
              ),
              // TransactionCard(
              //   horizontalPadding: 0,
              //   heading: const Headings(text: 'Quick Actions'),
              //   content: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       QuickActionCards(
              //         icon: SvgPicture.asset(
              //           'assets/icons/recharge.svg',
              //           width: 20,
              //           height: 20,
              //         ),
              //         text: 'Bills',
              //       ),
              //       QuickActionCards(
              //         icon: SvgPicture.asset(
              //           'assets/icons/charity.svg',
              //           width: 20,
              //           height: 20,
              //         ),
              //         text: 'Charity',
              //       ),
              //       QuickActionCards(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => const BankTransferScreen(),
              //             ),
              //           );
              //         },
              //         icon: const Icon(
              //           Icons.transform_rounded,
              //           color: Color(0xff004D43), // primaryColor
              //         ),
              //         text: 'Add Money',
              //       ),
              //       QuickActionCards(
              //         icon: SvgPicture.asset(
              //           'assets/icons/loan.svg',
              //           width: 20,
              //           height: 20,
              //         ),
              //         text: 'Loan',
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Column(
                  children: [
                    const TransactionCard(
                      heading: Headings(text: 'More for you'),
                      content: MoreForYouSection(),
                    ),
                    TransactionCard(
                      heading: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Headings(text: 'Transactions'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionsScreen(),
                                ),
                              );
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: kFontSizeMedium,
                                  ),
                                ),
                                SizedBox(width: kSpacingExtraSmall),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: kSpacingLarge,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      content: Builder(builder: (context) {
                        final allTransactions =
                            transactionsData.values.expand((e) => e).toList();
                        allTransactions
                            .sort((a, b) => b['date']!.compareTo(a['date']!));
                        final recentTransactions =
                            allTransactions.take(3).toList();
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: recentTransactions.length,
                          itemBuilder: (context, index) {
                            final transaction = recentTransactions[index];
                            return TransactionListItem(
                              transaction: transaction,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TransactionDetailsScreen(
                                            transaction: transaction),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }),
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
