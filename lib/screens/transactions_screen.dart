import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/components/general_components.dart';
import 'package:lea_pay/components/transaction_components.dart';
import 'package:lea_pay/data/card_data.dart';
import 'package:lea_pay/data/transaction_data.dart';
import 'package:lea_pay/screens/transaction_details_screen.dart';
import 'package:lea_pay/utils/constants.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  late List<Map<String, dynamic>> _allTransactions;
  List<Map<String, dynamic>> _filteredTransactions = [];
  String? _selectedCardId;
  DateTimeRange? _selectedDateRange;
  double? _minAmount;
  double? _maxAmount;

  @override
  void initState() {
    super.initState();
    _allTransactions = transactionsData.values.expand((e) => e).toList();
    _applyFilters();
  }

  void _applyFilters() {
    setState(() {
      _filteredTransactions = _allTransactions.where((tx) {
        final cardFilter =
            _selectedCardId == null || tx['cardId'] == _selectedCardId;

        final date = DateTime.parse(tx['date'] as String);
        final dateFilter = _selectedDateRange == null ||
            (date.isAfter(_selectedDateRange!.start
                    .subtract(const Duration(days: 1))) &&
                date.isBefore(
                    _selectedDateRange!.end.add(const Duration(days: 1))));

        final amount = double.parse(tx['price'] as String);
        final amountFilter = (_minAmount == null || amount >= _minAmount!) &&
            (_maxAmount == null || amount <= _maxAmount!);

        return cardFilter && dateFilter && amountFilter;
      }).toList();
    });
  }

  void _selectCard(String? cardId) {
    setState(() {
      _selectedCardId = cardId;
      _applyFilters();
    });
  }

  Future<void> _selectDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _selectedDateRange,
    );
    if (picked != null) {
      setState(() {
        _selectedDateRange = picked;
        _applyFilters();
      });
    }
  }

  Future<void> _showAmountFilterDialog() async {
    final minController =
        TextEditingController(text: _minAmount?.toString() ?? '');
    final maxController =
        TextEditingController(text: _maxAmount?.toString() ?? '');

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter by Amount'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: minController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    labelText: 'Minimum Amount', prefixText: '\$'),
              ),
              TextField(
                controller: maxController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    labelText: 'Maximum Amount', prefixText: '\$'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _minAmount = null;
                  _maxAmount = null;
                  _applyFilters();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Clear'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _minAmount = double.tryParse(minController.text);
                  _maxAmount = double.tryParse(maxController.text);
                  _applyFilters();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseAppComponent(
      appBar: SuffixNavigatorAppBar(
        header: 'Transactions',
        suffix: PrimaryIconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          action: () {},
        ),
      ),
      body: Column(
        children: [
          _buildFilterBar(),
          Expanded(child: _buildTransactionList()),
        ],
      ),
      showBottomNavBar: true,
    );
  }

  Widget _buildFilterBar() {
    String periodLabel = 'Period';
    if (_selectedDateRange != null) {
      final start = DateFormat.yMd().format(_selectedDateRange!.start);
      final end = DateFormat.yMd().format(_selectedDateRange!.end);
      periodLabel = '$start - $end';
    }

    String sumLabel = 'Sum';
    final isSumSelected = _minAmount != null || _maxAmount != null;
    if (isSumSelected) {
      if (_minAmount != null && _maxAmount != null) {
        sumLabel = '\$${_minAmount} - \$${_maxAmount}';
      } else if (_minAmount != null) {
        sumLabel = '> \$${_minAmount}';
      } else if (_maxAmount != null) {
        sumLabel = '< \$${_maxAmount}';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kSpacingMedium, horizontal: kSpacingSmall),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip(
              periodLabel,
              onTap: _selectDateRange,
              isSelected: _selectedDateRange != null,
            ),
            _buildCardDropdown(),
            _buildFilterChip(
              sumLabel,
              onTap: _showAmountFilterDialog,
              isSelected: isSumSelected,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label,
      {VoidCallback? onTap, bool isSelected = false}) {
    final chip = Chip(
      label: Row(
        children: [
          Text(label,
              style:
                  TextStyle(color: isSelected ? Colors.white : Colors.black)),
          Icon(Icons.keyboard_arrow_down,
              size: 18, color: isSelected ? Colors.white : Colors.black),
        ],
      ),
      backgroundColor: isSelected ? Colors.black : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadiusMedium),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacingSmall / 2),
      child: onTap != null
          ? GestureDetector(
              onTap: onTap,
              child: chip,
            )
          : chip,
    );
  }

  Widget _buildCardDropdown() {
    return Container(
      height: 48, // Match chip height
      padding: const EdgeInsets.symmetric(horizontal: kSpacingMedium),
      margin: const EdgeInsets.symmetric(horizontal: kSpacingSmall / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kRadiusMedium),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          value: _selectedCardId,
          isDense: true,
          hint: const Text('All Cards'),
          onChanged: (String? newValue) {
            _selectCard(newValue);
          },
          items: [
            const DropdownMenuItem<String?>(
              value: null,
              child: Text('All Cards'),
            ),
            ...cardsData.map<DropdownMenuItem<String?>>((card) {
              return DropdownMenuItem<String?>(
                value: card['cardId'] as String?,
                child: Text(
                    '${card['cardType']} .... ${card['cardNumber'].substring(12)}'),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    if (_filteredTransactions.isEmpty) {
      return const Center(child: Text('No transactions found.'));
    }

    final Map<String, List<Map<String, dynamic>>> groupedTransactions = {};
    for (var tx in _filteredTransactions) {
      final date = tx['date'] as String;
      if (groupedTransactions[date] == null) {
        groupedTransactions[date] = [];
      }
      groupedTransactions[date]!.add(tx);
    }

    final sortedDates = groupedTransactions.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: kSpacingMedium),
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        final dateStr = sortedDates[index];
        final date = DateTime.parse(dateStr);
        final formattedDate = DateFormat('MMMM d, EEE').format(date);

        final transactionsOnDate = groupedTransactions[dateStr]!;
        final total = transactionsOnDate.fold(0.0, (sum, item) {
          final amount = double.parse(item['price'] as String);
          return item['type'] == 'credit' ? sum + amount : sum - amount;
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kSpacingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formattedDate,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text('\$${total.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kRadiusXLarge),
              ),
              child: Column(
                children: transactionsOnDate.map((tx) {
                  return TransactionListItem(
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
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: kSpacingMedium),
          ],
        );
      },
    );
  }
}
