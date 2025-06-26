import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/screens/transaction_status_screen.dart';
import 'package:lea_pay/services/mock_api_service.dart';
import 'package:lea_pay/utils/constants.dart';

class AmountInputScreen extends StatefulWidget {
  final String bankName;

  const AmountInputScreen({
    super.key,
    required this.bankName,
  });

  @override
  State<AmountInputScreen> createState() => _AmountInputScreenState();
}

class _AmountInputScreenState extends State<AmountInputScreen> {
  final _apiService = MockApiService();
  bool _isProcessing = false;
  String _amount = '0'; // Storing amount in cents as a string

  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'DEL') {
        if (_amount.length > 1) {
          _amount = _amount.substring(0, _amount.length - 1);
        } else {
          _amount = '0';
        }
      } else {
        if (_amount == '0') {
          _amount = value;
        } else {
          // Limit length to avoid overflow, e.g., 9 digits for up to 999,999.99
          if (_amount.length < 9) {
            _amount += value;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double amountValue = (int.tryParse(_amount) ?? 0) / 100.0;
    final formattedAmount = NumberFormat.currency(locale: 'en_US', symbol: '\$')
        .format(amountValue);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(
        prefix: BackNavButton(),
        header: 'Enter Amount',
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: kRadiusXXLarge,
                  backgroundColor: kLightGreyColor,
                  child: Icon(Icons.account_balance,
                      color: Colors.grey,
                      size: kRadiusXXLarge), // Matched size to radius
                ),
                const SizedBox(height: kSpacingLarge),
                Text(
                  'To: ${widget.bankName}',
                  style: const TextStyle(
                      fontSize: kFontSizeMedium, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: kSpacingXXXLarge),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      formattedAmount,
                      style: const TextStyle(
                        fontSize: kAmountFontSize,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildNumericKeypad(),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: PrimaryButton(
              text: _isProcessing ? 'Processing...' : 'Continue',
              action: (amountValue > 0 && !_isProcessing)
                  ? () async {
                      setState(() {
                        _isProcessing = true;
                      });

                      final success = await _apiService.initiateTransaction();

                      if (!mounted) return;

                      // Capture the navigator before the async gap.
                      final navigator = Navigator.of(context);

                      if (success) {
                        navigator.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>
                                TransactionStatusScreen(success: success),
                          ),
                        );
                      }
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumericKeypad() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.8,
      padding: const EdgeInsets.symmetric(horizontal: kSpacingXXXLarge),
      children: [
        ...['1', '2', '3', '4', '5', '6', '7', '8', '9'].map((key) {
          return _buildKey(key);
        }),
        Container(), // Placeholder for the bottom left corner
        _buildKey('0'),
        _buildKey('DEL', isIcon: true, icon: Icons.backspace_outlined),
      ],
    );
  }

  Widget _buildKey(String text, {bool isIcon = false, IconData? icon}) {
    return InkWell(
      borderRadius: BorderRadius.circular(kRadiusXXXLarge),
      onTap: () => _onKeyPressed(text),
      child: Center(
        child: isIcon
            ? Icon(icon, color: Colors.black54, size: kKeypadIconSize)
            : Text(
                text,
                style: const TextStyle(
                    fontSize: kKeypadFontSize, fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}
