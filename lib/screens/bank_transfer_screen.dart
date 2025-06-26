import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/screens/amount_input_screen.dart';
import 'package:lea_pay/services/mock_api_service.dart';
import 'package:lea_pay/utils/constants.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({super.key});

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  String? _selectedBank;
  final _searchController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _apiService = MockApiService();
  Timer? _debounce;
  bool _isVerifying = false;
  bool _verificationSuccess = false;
  bool _verificationAttempted = false;
  String? _accountName;

  List<String> _filteredBanks = [];
  final List<String> _banks = [
    'Access Bank',
    'Citibank',
    'Ecobank',
    'Fidelity Bank',
    'First Bank',
    'GTBank',
    'Keystone Bank',
    'Polaris Bank',
    'Stanbic IBTC Bank',
    'Standard Chartered Bank',
    'Sterling Bank',
    'UBA',
    'Union Bank',
    'Wema Bank',
    'Zenith Bank',
  ];

  @override
  void initState() {
    super.initState();
    _filteredBanks = _banks;
    _searchController.addListener(_filterBanks);
    _accountNumberController.addListener(_onAccountNumberChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  void _filterBanks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredBanks =
          _banks.where((bank) => bank.toLowerCase().contains(query)).toList();
    });
  }

  void _onAccountNumberChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      if (_accountNumberController.text.isNotEmpty) {
        _verifyAccount(_accountNumberController.text);
      } else {
        // Reset verification status if the field is cleared
        setState(() {
          _verificationAttempted = false;
          _verificationSuccess = false;
          _accountName = null;
        });
      }
    });
  }

  Future<void> _verifyAccount(String accountNumber) async {
    setState(() {
      _isVerifying = true;
      _verificationAttempted = true;
    });

    final result =
        await _apiService.verifyAccount(accountNumber: accountNumber);
    final success = result['success'] as bool;
    final accountName = result['accountName'] as String?;

    setState(() {
      _isVerifying = false;
      _verificationSuccess = success;
      _accountName = accountName;
    });

    Fluttertoast.showToast(
      msg: success ? "Account verified" : "Invalid account",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: success ? kSuccessColor : kErrorColor,
      textColor: Colors.white,
      fontSize: kFontSizeMedium,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(
        prefix: BackNavButton(),
        header: 'Bank Transfer',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                kDefaultPadding, kDefaultPadding, kDefaultPadding, 0),
            child: Column(
              children: [
                // Bank Search
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search bank',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kRadiusDefault),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: kLightGreyColor,
                  ),
                ),
                const SizedBox(height: kSpacingXLarge),
                // Account Number Input
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _accountNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Account Number',
                        border: const OutlineInputBorder(),
                        suffixIcon: _buildSuffixIcon(),
                      ),
                    ),
                    if (_verificationSuccess && _accountName != null)
                      Padding(
                        padding: const EdgeInsets.only(top: kSpacingSmall),
                        child: Text(
                          _accountName!,
                          style: const TextStyle(
                            fontSize: kFontSizeMedium,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: kSpacingMedium),
              itemCount: _filteredBanks.length,
              itemBuilder: (context, index) {
                final bank = _filteredBanks[index];
                return RadioListTile<String>(
                  title: Text(bank),
                  value: bank,
                  groupValue: _selectedBank,
                  onChanged: (value) {
                    setState(() {
                      _selectedBank = value;
                    });
                  },
                  activeColor: kPrimaryColor,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: PrimaryButton(
              text: 'Continue',
              action: (_selectedBank != null && _verificationSuccess)
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AmountInputScreen(
                            bankName: _selectedBank!,
                          ),
                        ),
                      );
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (_isVerifying) {
      return const Padding(
        padding: EdgeInsets.all(kSpacingMedium),
        child: SizedBox(
          height: kCircularProgressSize,
          width: kCircularProgressSize,
          child: CircularProgressIndicator(
              strokeWidth: kCircularProgressStrokeWidth),
        ),
      );
    }
    if (_verificationAttempted) {
      return Icon(
        _verificationSuccess ? Icons.check_circle : Icons.cancel,
        color: _verificationSuccess ? kSuccessColor : kErrorColor,
      );
    }
    return null;
  }
}
