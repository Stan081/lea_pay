import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transactions.dart';
import 'package:lea_pay/components/virtual_card_components.dart';
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

  List<Map<String, dynamic>> _cards = []; // Store fetched cards
  List<TransactionItem> _transactions =
      []; // Store transactions for the selected card
  bool _isLoadingCards = true; // Loading state for cards
  bool _isLoadingTransactions = false; // Loading state for transactions

  @override
  void initState() {
    super.initState();
    _fetchCards();
  }

  Future<void> _fetchCards() async {
    try {
      // Simulate an API call to fetch cards
      await Future.delayed(const Duration(seconds: 2)); // Simulated delay
      final List<Map<String, dynamic>> apiResponse = [
        {
          "cardId": "1",
          "cardHolderName": "John Doe",
          "cardNumber": "1234567812345678",
          "expiryDate": "12/25",
          "cvv": "123",
          "isSelected": true,
        },
        {
          "cardId": "2",
          "cardHolderName": "Jane Smith",
          "cardNumber": "8765432187654321",
          "expiryDate": "11/24",
          "cvv": "456",
          "isSelected": false,
        },
        {
          "cardId": "3",
          "cardHolderName": "Alice Johnson",
          "cardNumber": "1111222233334444",
          "expiryDate": "10/26",
          "cvv": "789",
          "isSelected": false,
        },
      ];

      setState(() {
        _cards = apiResponse; // Update the cards list
        _isLoadingCards = false; // Set loading to false
      });

      // Fetch transactions for the first card by default
      if (_cards.isNotEmpty) {
        _fetchTransactions(_cards[0]['cardId']);
      }
    } catch (e) {
      setState(() {
        _isLoadingCards = false;
      });
    }
  }

  Future<void> _fetchTransactions(String cardId) async {
    try {
      setState(() {
        _isLoadingTransactions = true;
      });

      // Simulate an API call to fetch transactions for the selected card
      await Future.delayed(const Duration(seconds: 2)); // Simulated delay
      final List<Map<String, dynamic>> apiResponse = {
            "1": [
              {
                "vendor": "Netflix",
                "logo": "assets/icons/netflix.png",
                "price": "10.00",
                "time": "11:00 AM",
                "points": "25",
              },
              {
                "vendor": "Paypal",
                "logo": "assets/icons/paypal.png",
                "price": "200.00",
                "time": "02:35 PM",
                "points": "10",
              },
            ],
            "2": [
              {
                "vendor": "Spotify",
                "logo": "assets/icons/spotify.png",
                "price": "23.85",
                "time": "07:47 PM",
                "points": "0",
              },
            ],
            "3": [
              {
                "vendor": "Amazon",
                "logo": "assets/icons/netflix.png",
                "price": "50.00",
                "time": "03:00 PM",
                "points": "15",
              },
              {
                "vendor": "Uber",
                "logo": "assets/icons/paypal.png",
                "price": "15.00",
                "time": "09:00 AM",
                "points": "5",
              },
            ],
          }[cardId] ??
          [];

      setState(() {
        _transactions = apiResponse
            .map((transaction) => TransactionItem(
                  vendor: transaction['vendor'],
                  logo: transaction['logo'],
                  price: transaction['price'],
                  time: transaction['time'],
                  points: transaction['points'],
                ))
            .toList();
        _isLoadingTransactions = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingTransactions = false;
      });
    }
  }

  @override
  void dispose() {
    _cardPageController.dispose();
    _transactionScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
      showBottomNavBar: true,
      appBar: const CustomAppBar(
        header: 'Wallet',
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _isLoadingCards
            ? const Center(
                child:
                    CircularProgressIndicator()) // Show loader while fetching cards
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: (defaultSpacing *
                          5), // Adjust height for the card list
                      child: PageView.builder(
                        controller: _cardPageController,
                        onPageChanged: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                          _fetchTransactions(_cards[index]['cardId']);
                        },
                        itemCount: _cards.length,
                        itemBuilder: (context, index) {
                          final card = _cards[index];
                          return Center(
                            child: VirtualCard(
                              cardHolderName: card['cardHolderName'],
                              cardNumber: card['cardNumber'],
                              expiryDate: card['expiryDate'],
                              cvv: card['cvv'],
                              isSelected: index == _selectedIndex,
                            ),
                          );
                        },
                      ),
                    ),
                    const VirtualCardActions(),
                    _isLoadingTransactions
                        ? const Center(
                            child:
                                CircularProgressIndicator()) // Show loader while fetching transactions
                        : TransactionCard(
                            heading: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Headings(
                                          text:
                                              'October ${17 + _selectedIndex}, Thu'),
                                      Headings(
                                          text:
                                              '\$${_transactions.fold<double>(0, (sum, item) => sum + double.parse(item.price)).toStringAsFixed(2)}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            content: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: _transactions,
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
