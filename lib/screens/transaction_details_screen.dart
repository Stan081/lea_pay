import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/utils/contants.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({super.key});

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
      showBottomNavBar: false,
      appBar: CustomAppBar(
        prefix: Padding(
          padding: const EdgeInsets.all(6),
          child: PrimaryIconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            ),
            action: () {
              Navigator.pop(context);
            },
          ),
        ),
        header: 'Transactions',
        suffix: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // Close the screen or perform some action
          },
        ),
      ),
      // const NavigatorAppBar(
      //   header: 'Details',
      //   color: Colors.white,
      // ),
      color: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '-\$1,000.00',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const AppBarSubHeaderText(text: 'Transfer to Jasmine Suleiman'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: backgroundColor),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Text(
                          'Mon, Oct 20, 02:40 PM',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: backgroundColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBarSubHeaderText(
                            text: 'Status',
                          ),
                          Text(
                            'Complete',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBarSubHeaderText(
                            text: 'Routing Number',
                          ),
                          Text(
                            '031101279',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBarSubHeaderText(
                            text: 'Account Number',
                          ),
                          Text(
                            '389151184360',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBarSubHeaderText(
                            text: 'Bank Nmae',
                          ),
                          Text(
                            'Bank of America',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBarSubHeaderText(
                            text: 'Note',
                          ),
                          Text(
                            'for Starbucks',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'Problem with this transaction?',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
