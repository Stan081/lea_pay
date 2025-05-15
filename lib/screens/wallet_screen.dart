import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/dashboard_components.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transactions.dart';
import 'package:lea_pay/components/virtual_card.dart';
import 'package:lea_pay/utils/contants.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final PageController _cardPageController =
      PageController(viewportFraction: 0.8);
  final ScrollController _transactionScrollController = ScrollController();
  int _selectedIndex = 0;

  final List<List<TransactionItem>> _transactions = [
    [
      const TransactionItem(
        vendor: 'Netflix',
        logo: 'assets/icons/netflix.png',
        price: '10.00',
        time: '11:00 AM',
        points: '25',
      ),
      const TransactionItem(
        vendor: 'Paypal',
        logo: 'assets/icons/paypal.png',
        price: '200.00',
        time: '02:35 PM',
        points: '10',
      ),
    ],
    [
      const TransactionItem(
        vendor: 'Spotify',
        logo: 'assets/icons/spotify.png',
        price: '23.85',
        time: '07:47 PM',
        points: '0',
      ),
    ],
    [
      const TransactionItem(
        vendor: 'Amazon',
        logo: 'assets/icons/netflix.png',
        price: '50.00',
        time: '03:00 PM',
        points: '15',
      ),
    ],
    [
      const TransactionItem(
        vendor: 'Uber',
        logo: 'assets/icons/paypal.png',
        price: '15.00',
        time: '09:00 AM',
        points: '5',
      ),
    ],
  ];

  @override
  void dispose() {
    _cardPageController.dispose();
    _transactionScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      appBar: const CustomAppBar(
        header: 'Wallet',
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: (defaultSpacing * 4), // Adjust height for the card list
                child: PageView.builder(
                  controller: _cardPageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    return VirtualCard(
                      isSelected: index == _selectedIndex,
                    );
                  },
                ),
              ),
              TransactionCard(
                heading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Headings(text: 'October ${17 + _selectedIndex}, Thu'),
                          Headings(
                              text:
                                  '\$${_transactions[_selectedIndex].fold<double>(0, (sum, item) => sum + double.parse(item.price)).toStringAsFixed(2)}'),
                        ],
                      ),
                    ],
                  ),
                ),
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _transactions[_selectedIndex],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class VirtualCard extends StatelessWidget {
//   final bool isSelected;

//   const VirtualCard({super.key, required this.isSelected});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue : Colors.grey[300],
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: isSelected
//             ? [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 10,
//                   offset: Offset(0, 5),
//                 ),
//               ]
//             : [],
//       ),
//       width: isSelected ? 350 : 330,
//       height: isSelected ? 200 : 180,
//       child: Center(
//         child: Text(
//           isSelected ? 'Selected Card' : 'Card',
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
