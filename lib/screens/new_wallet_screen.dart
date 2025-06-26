import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/data/transaction_data.dart';
import 'package:lea_pay/utils/constants.dart';
import 'package:lea_pay/components/transaction_components.dart';
import 'package:lea_pay/screens/transaction_details_screen.dart';

class NewWalletScreen extends StatefulWidget {
  const NewWalletScreen({super.key});

  @override
  State<NewWalletScreen> createState() => _NewWalletScreenState();
}

class _NewWalletScreenState extends State<NewWalletScreen>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>> _cards = [];
  List<Map<String, dynamic>> _transactions = [];
  bool _isLoadingCards = true;
  bool _isLoadingTransactions = true;
  int _currentIndex = 0;
  bool _showDetails = false;
  DateTimeRange? _selectedDateRange;

  late AnimationController _animationController;
  late Animation<double> _animation;
  double _dragOffsetY = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchCards();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 0.0).animate(_animationController)
          ..addListener(() {
            setState(() {
              _dragOffsetY = _animation.value;
            });
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _fetchCards() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final List<Map<String, dynamic>> apiResponse = [
        {
          "cardId": "1",
          "cardType": "Savings",
          "cardHolderName": "Jasmine Suleiman",
          "cardNumber": "1234567812345678",
          "balance": "20,420.78",
          "color": Colors.green,
        },
        {
          "cardId": "2",
          "cardType": "Current",
          "cardHolderName": "Jasmine Suleiman",
          "cardNumber": "8765432187654321",
          "balance": "3,800.54",
          "color": Colors.blue,
        },
        {
          "cardId": "3",
          "cardType": "Business",
          "cardHolderName": "Jasmine Suleiman",
          "cardNumber": "1111222233334444",
          "balance": "15,120.00",
          "color": Colors.orange,
        },
      ];

      if (mounted) {
        setState(() {
          _cards = apiResponse;
          _isLoadingCards = false;
        });
        if (_cards.isNotEmpty) {
          _fetchTransactionsForCard(_cards.first['cardId']);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingCards = false;
        });
      }
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffsetY += details.delta.dy;
    });
  }

  Future<void> _fetchTransactionsForCard(String cardId) async {
    if (mounted) {
      setState(() {
        _isLoadingTransactions = true;
      });
    }
    await Future.delayed(const Duration(milliseconds: 500));

    final allTransactions = transactionsData.values.expand((e) => e).toList();
    final cardTransactions =
        allTransactions.where((t) => t['cardId'] == cardId).toList();

    cardTransactions
        .sort((a, b) => (b['date'] as String).compareTo(a['date'] as String));

    if (mounted) {
      setState(() {
        _transactions = cardTransactions;
        _isLoadingTransactions = false;
      });
    }
  }

  void _toggleDetails() {
    setState(() {
      _showDetails = !_showDetails;
    });
  }

  Future<void> _showFilterDialog() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _selectedDateRange,
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_dragOffsetY.abs() > 100) {
      // Swipe threshold
      final double endValue =
          _dragOffsetY < 0 ? -250.0 : 250.0; // Animate off-screen

      _animation = Tween<double>(
        begin: _dragOffsetY,
        end: endValue,
      ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

      _animationController.forward(from: 0.0).whenComplete(() {
        setState(() {
          if (_dragOffsetY < 0 && _currentIndex < _cards.length - 1) {
            _currentIndex++;
          } else if (_dragOffsetY > 0 && _currentIndex > 0) {
            _currentIndex--;
          }
          _animationController.reset();
          _dragOffsetY = 0.0;
          _fetchTransactionsForCard(_cards[_currentIndex]['cardId']);
        });
      });
    } else {
      // Not a full swipe, animate back to original position
      _animation = Tween<double>(
        begin: _dragOffsetY,
        end: 0.0,
      ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
      _animationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
      showBottomNavBar: false,
      color: backgroundColor,
      appBar: SuffixNavigatorAppBar(
        header: 'Wallet',
        suffix: PrimaryIconButton(
          icon: const Icon(
            Icons.search_outlined,
            size: kIconButtonSize / 1.5,
            color: kPrimaryColor,
          ),
          action: () {
            // TODO: Implement help functionality
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kSpacingLarge),
              _isLoadingCards
                  ? const Center(child: CircularProgressIndicator())
                  : _buildStackedCards(),
              const SizedBox(height: kSpacingXLarge),
              _buildQuickActions(),
              const SizedBox(height: kSpacingLarge),
              _buildMonthlySummary(),
              const SizedBox(height: kSpacingLarge),
              _buildHistoryHeader(),
              const SizedBox(height: kSpacingLarge),
              _isLoadingTransactions
                  ? const Center(child: CircularProgressIndicator())
                  : _buildTransactionList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStackedCards() {
    if (_isLoadingCards) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.only(left: kSpacingMedium),
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 100) {
            // Swipe Right
            if (_currentIndex > 0) {
              setState(() {
                _currentIndex--;
                _fetchTransactionsForCard(_cards[_currentIndex]['cardId']);
              });
            }
          } else if (details.primaryVelocity! < -100) {
            // Swipe Left
            if (_currentIndex < _cards.length - 1) {
              setState(() {
                _currentIndex++;
                _fetchTransactionsForCard(_cards[_currentIndex]['cardId']);
              });
            }
          }
        },
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragEnd: _onVerticalDragEnd,
        child: Container(
          height: kCardHeight + 40,
          alignment: Alignment.center,
          child: Stack(
            children: List.generate(_cards.length, (index) {
              final card = _cards[index];
              final isCurrent = index == _currentIndex;
              final isSecond = index == _currentIndex + 1;
              final isThird = index == _currentIndex + 2;

              final double swipeProgress =
                  (_dragOffsetY / 100.0).clamp(-1.0, 1.0);

              double top = 0;
              double scale = 1.0;
              double opacity = 0.0;

              if (isCurrent) {
                top = _dragOffsetY;
                scale = 1.0 - (swipeProgress.abs() * 0.1);
                opacity = 1.0;
              } else if (isSecond) {
                top = 20.0 * (1 - swipeProgress.abs());
                scale = 0.9 + (swipeProgress.abs() * 0.1);
                opacity = 1.0;
              } else if (isThird) {
                top = 40.0 - 20.0 * swipeProgress.abs();
                scale = 0.8 + (swipeProgress.abs() * 0.1);
                opacity = 1.0;
              }

              if (index < _currentIndex || index > _currentIndex + 2) {
                opacity = 0.0;
              }

              return Positioned(
                top: top,
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: _buildCard(card),
                  ),
                ),
              );
            }).reversed.toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionItem(Icons.add_circle_outline, 'Add Money'),
        _buildActionItem(Icons.send, 'Send Money'),
        _buildActionItem(Icons.ac_unit, 'Freeze'),
        _buildActionItem(_showDetails ? Icons.visibility_off : Icons.visibility,
            _showDetails ? 'Hide' : 'View'),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    VoidCallback? onPressed;
    if (label == 'View' || label == 'Hide') {
      onPressed = _toggleDetails;
    }

    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(kRadiusMedium),
          child: Container(
            padding: const EdgeInsets.all(kSpacingLarge),
            decoration: BoxDecoration(
              color: kGreyColor,
              borderRadius: BorderRadius.circular(kRadiusMedium),
            ),
            child:
                Icon(icon, size: (kIconSizeMedium + 5), color: kDarkGreyColor),
          ),
        ),
        const SizedBox(height: kSpacingSmall),
        Text(
          label,
          style:
              const TextStyle(fontSize: kFontSizeSmall, color: kDarkGreyColor),
        ),
      ],
    );
  }

  Widget _buildMonthlySummary() {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kRadiusXLarge),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Spent this month',
                  style: TextStyle(
                      color: kDarkGreyColor, fontSize: kFontSizeSmall),
                ),
                const SizedBox(height: kSpacingSmall),
                const Text(
                  '\$3,800.54',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: kFontSizeXLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: kSpacingMedium),
                Row(
                  children: [
                    _buildProgressBarSegment(Colors.blue.shade700, 45),
                    _buildProgressBarSegment(Colors.orange.shade400, 25),
                    _buildProgressBarSegment(Colors.red.shade400, 15),
                    _buildProgressBarSegment(Colors.teal.shade300, 20),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: kSpacingLarge),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Send',
                style: TextStyle(
                    color: Colors.grey[600], fontSize: kFontSizeSmall),
              ),
              const SizedBox(height: kSpacingXLarge),
              Row(
                children: [
                  _buildAvatar(
                      'https://randomuser.me/api/portraits/women/68.jpg'),
                  _buildAvatar(
                      'https://randomuser.me/api/portraits/men/46.jpg'),
                  _buildAvatar(
                      'https://randomuser.me/api/portraits/men/86.jpg'),
                  _buildPlusAvatar('+6'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProgressBarSegment(Color color, double width) {
    return Container(
      height: 8,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kRadiusSmall),
      ),
      margin: const EdgeInsets.only(right: kSpacingTiny),
    );
  }

  Widget _buildAvatar(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: kSpacingTiny),
      child: CircleAvatar(
        radius: kFontSizeSmall,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }

  Widget _buildPlusAvatar(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: kSpacingExtraSmall),
      child: Container(
        decoration: const BoxDecoration(
          color: kLightGreyColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: kFontSizeExtraSmall, color: kDarkGreyColor),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'History',
          style:
              TextStyle(fontSize: kFontSizeLarge, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.filter_list, color: kDarkGreyColor),
              onPressed: _showFilterDialog,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See all',
                style:
                    TextStyle(color: kDarkGreyColor, fontSize: kFontSizeSmall),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTransactionList() {
    if (_isLoadingTransactions) {
      return const Center(child: CircularProgressIndicator());
    }

    final filteredTransactions = _transactions.where((tx) {
      if (_selectedDateRange == null) return true;
      final txDate = DateTime.parse(tx['date'] as String);
      return txDate.isAfter(_selectedDateRange!.start) &&
          txDate.isBefore(_selectedDateRange!.end);
    }).toList();

    if (filteredTransactions.isEmpty) {
      return const Center(
        child: Text(
          'No transactions found for this period.',
          style: TextStyle(color: kDarkGreyColor, fontSize: kFontSizeMedium),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: filteredTransactions
          .map((tx) => Padding(
                padding: const EdgeInsets.only(bottom: kSpacingSmall),
                child: TransactionListItem(
                  transaction: tx,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TransactionDetailsScreen(transaction: tx),
                      ),
                    );
                  },
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCard(Map<String, dynamic> cardData) {
    return Container(
      height: kCardHeight,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: cardData['color'] as Color,
        borderRadius: BorderRadius.circular(kRadiusXLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: kSpacingMedium,
            offset: const Offset(0, kSpacingSmall),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardData['cardType'] as String,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: kFontSizeSmall,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$${cardData['balance'] as String}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: kFontSizeMedium,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Center(
            child: Text(
              _showDetails
                  ? '${cardData['cardNumber'].substring(0, 4)} **** **** ${cardData['cardNumber'].substring(12)}'
                  : '**** **** **** ${cardData['cardNumber'].substring(12)}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: kFontSizeLarge,
                  letterSpacing: 2),
            ),
          ),
          Text(
            cardData['cardHolderName'] as String,
            style: const TextStyle(
                color: Colors.white,
                fontSize: kFontSizeSmall,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
