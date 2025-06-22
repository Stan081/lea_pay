import 'package:flutter/material.dart';
import 'package:lea_pay/components/appbar.dart';
import 'package:lea_pay/components/buttons.dart';
import 'package:lea_pay/utils/contants.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({super.key});

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  String? _selectedBank;

  // TODO: Replace with actual bank data and asset paths
  final List<Map<String, dynamic>> _banks = [
    {'name': 'Byline Bank', 'logo': 'assets/images/byline_logo.png'},
    {'name': 'Shamrock Bank', 'logo': 'assets/images/shamrock_logo.png'},
    {'name': 'M&T Bank', 'logo': 'assets/images/mt_bank_logo.png'},
    {'name': 'Truist Financial', 'logo': 'assets/images/truist_logo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        prefix: const BackNavButton(),
        header: 'Bank Transfer',
        suffix: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // Close the screen or perform some action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Transfer to Bank',
              style: TextStyle(
                  fontSize: headingFontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Search or select recipients bank',
              style:
                  TextStyle(fontSize: subheadingFontSize, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _banks.length,
                itemBuilder: (context, index) {
                  final bank = _banks[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      // leading: Image.asset(bank['logo'], width: 40, height: 40),
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: const Icon(Icons.account_balance,
                            color: Colors.grey),
                      ),
                      title: Text(bank['name']),
                      trailing: Radio<String>(
                        value: bank['name'],
                        groupValue: _selectedBank,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedBank = value;
                          });
                        },
                        activeColor: primaryColor,
                      ),
                      onTap: () {
                        setState(() {
                          _selectedBank = bank['name'];
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: ElevatedButton(
            //       onPressed: _selectedBank == null ? null : () {},
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.blue,
            //         padding: const EdgeInsets.symmetric(vertical: 16),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         disabledBackgroundColor: Colors.blue.withOpacity(0.5),
            //       ),
            //       child: const Text(
            //         'Continue',
            //         style: TextStyle(fontSize: 18, color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: PrimaryButton(
                text: 'Continue',
                action: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const DashboardScreen(),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
